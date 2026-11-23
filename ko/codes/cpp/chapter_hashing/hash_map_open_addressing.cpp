/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
  private:
    int size;                             // 키-값 쌍 개수
    int capacity = 4;                     // 해시 테이블 용량
    const double loadThres = 2.0 / 3.0;     // 용량 확장을 수행하는 적재율 임계값
    const int extendRatio = 2;            // 용량 확장 배수
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

    /* key에 해당하는 버킷 인덱스 탐색 */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
        while (buckets[index] != nullptr) {
            // key를 만나면 해당 버킷 인덱스를 반환한다
            if (buckets[index]->key == key) {
                // 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 옮긴 후의 버킷 인덱스를 반환한다
                }
                return index; // 버킷 인덱스를 반환한다
            }
            // 처음 만난 삭제 표시를 기록한다
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
            index = (index + 1) % capacity;
        }
        // key가 없으면 추가할 위치의 인덱스를 반환한다
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 조회 연산 */
    string get(int key) {
        // key에 해당하는 버킷 인덱스 탐색
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 해당 val을 반환한다
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // 키-값 쌍이 없으면 빈 문자열을 반환한다
        return "";
    }

    /* 추가 연산 */
    void put(int key, string val) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (loadFactor() > loadThres) {
            extend();
        }
        // key에 해당하는 버킷 인덱스 탐색
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 삭제 연산 */
    void remove(int key) {
        // key에 해당하는 버킷 인덱스 탐색
        int index = findBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 해시 테이블 용량 확장 */
    void extend() {
        // 원래 해시 테이블을 임시로 저장한다
        vector<Pair *> bucketsTmp = buckets;
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

/* 실행 코드 */
int main() {
    // 해시 테이블 초기화
    HashMapOpenAddressing hashmap;

    // 추가 연산
    // 해시 테이블에 키-값 쌍 (key, val)을 추가한다
    hashmap.put(12836, "小哈");
    hashmap.put(15937, "小啰");
    hashmap.put(16750, "小算");
    hashmap.put(13276, "小法");
    hashmap.put(10583, "小鸭");
    cout << "\n추가를 마친 후의 해시 테이블\n키 -> 값" << endl;
    hashmap.print();

    // 조회 연산
    // 해시 테이블에 키 key를 입력하여 값 val을 얻는다
    string name = hashmap.get(13276);
    cout << "\n학번 13276을 입력하여 조회한 이름 " << name << endl;

    // 삭제 연산
    // 해시 테이블에서 키-값 쌍 (key, val)을 삭제한다
    hashmap.remove(16750);
    cout << "\n16750을 삭제한 후의 해시 테이블\n키 -> 값" << endl;
    hashmap.print();

    return 0;
}
