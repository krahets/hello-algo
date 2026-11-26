/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
  private:
    int size;                             // 키-값 쌍의 개수
    int capacity = 4;                     // 해시 테이블의 용량
    const double loadThres = 2.0 / 3.0;     // 용량을 늘리는 기준이 되는 적재율
    const int extendRatio = 2;            // 용량 증가 배수
    vector<Pair *> buckets;               // 버킷 배열
    Pair *TOMBSTONE = new Pair(-1, "-1"); // 삭제 표시

  public:
    /* 생성자 */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* 소멸자 */
    ~HashMapOpenAddressing() {
        for (Pair *pair : buckets) {
            if (pair != nullptr && pair != TOMBSTONE) {
                delete pair;
            }
        }
        delete TOMBSTONE;
    }

    /* 해시 함수 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 적재율 */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* key에 해당하는 버킷 인덱스 찾기 */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 선형 탐사 중 빈 버킷을 만나면 반복 종료
        while (buckets[index] != nullptr) {
            // key를 만나면 해당 버킷 인덱스 반환
            if (buckets[index]->key == key) {
                // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 옮긴 뒤의 버킷 인덱스 반환
                }
                return index; // 버킷 인덱스 반환
            }
            // 처음 만난 삭제 표시의 위치 기록
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % capacity;
        }
        // key가 없으면 삽입할 위치의 인덱스 반환
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 조회 */
    string get(int key) {
        // key에 해당하는 버킷 인덱스 찾기
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 해당 val 반환
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // 키-값 쌍이 없으면 빈 문자열 반환
        return "";
    }

    /* 추가 */
    void put(int key, string val) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (loadFactor() > loadThres) {
            extend();
        }
        // key에 해당하는 버킷 인덱스 찾기
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // 키-값 쌍이 없으면 새로 추가
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 삭제 */
    void remove(int key) {
        // key에 해당하는 버킷 인덱스 찾기
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 해시 테이블 용량 늘리기 */
    void extend() {
        // 기존 해시 테이블 임시 보관
        vector<Pair *> bucketsTmp = buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* 해시 테이블 출력 */
    void print() {
        for (Pair *pair : buckets) {
            if (pair == nullptr) {
                cout << "nullptr" << endl;
            } else if (pair == TOMBSTONE) {
                cout << "TOMBSTONE" << endl;
            } else {
                cout << pair->key << " -> " << pair->val << endl;
            }
        }
    }
};

/* 실행 예제 */
int main() {
    // 해시 테이블 초기화
    HashMapOpenAddressing hashmap;

    // 추가
    // 해시 테이블에 키-값 쌍 (key, val) 추가
    hashmap.put(12836, "샤오하");
    hashmap.put(15937, "샤오뤄");
    hashmap.put(16750, "샤오쑤안");
    hashmap.put(13276, "샤오파");
    hashmap.put(10583, "샤오야");
    cout << "\n추가 후 해시 테이블\nKey -> Value" << endl;
    hashmap.print();

    // 조회
    // 해시 테이블에 키 key를 입력하여 값 val 조회
    string name = hashmap.get(13276);
    cout << "\n학번 13276으로 조회한 이름: " << name << endl;

    // 삭제
    // 해시 테이블에서 키-값 쌍 (key, val) 삭제
    hashmap.remove(16750);
    cout << "\n키 16750 삭제 후 해시 테이블\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
