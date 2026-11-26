/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 체이닝 해시 테이블 */
class HashMapChaining {
  private:
    int size;                       // 키-값 쌍의 개수
    int capacity;                   // 해시 테이블의 용량
    double loadThres;               // 용량을 늘리는 기준이 되는 적재율
    int extendRatio;                // 용량 증가 배수
    vector<vector<Pair *>> buckets; // 버킷 배열

  public:
    /* 생성자 */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* 소멸자 */
    ~HashMapChaining() {
        for (auto &bucket : buckets) {
            for (Pair *pair : bucket) {
                // 메모리 해제
                delete pair;
            }
        }
    }

    /* 해시 함수 */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* 적재율 */
    double loadFactor() {
        return (double)size / (double)capacity;
    }

    /* 조회 */
    string get(int key) {
        int index = hashFunc(key);
        // 버킷을 순회하다가 key를 찾으면 해당 val 반환
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // key를 찾지 못하면 빈 문자열 반환
        return "";
    }

    /* 추가 */
    void put(int key, string val) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 삭제 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // 버킷을 순회하며 해당 키-값 쌍 삭제
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // 여기서 키-값 쌍 삭제
                delete tmp;                       // 메모리 해제
                size--;
                return;
            }
        }
    }

    /* 해시 테이블 용량 늘리기 */
    void extend() {
        // 기존 해시 테이블 임시 보관
        vector<vector<Pair *>> bucketsTmp = buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // 메모리 해제
                delete pair;
            }
        }
    }

    /* 해시 테이블 출력 */
    void print() {
        for (auto &bucket : buckets) {
            cout << "[";
            for (Pair *pair : bucket) {
                cout << pair->key << " -> " << pair->val << ", ";
            }
            cout << "]\n";
        }
    }
};

/* 실행 예제 */
int main() {
    /* 해시 테이블 초기화 */
    HashMapChaining map = HashMapChaining();

    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.put(12836, "샤오하");
    map.put(15937, "샤오뤄");
    map.put(16750, "샤오쑤안");
    map.put(13276, "샤오파");
    map.put(10583, "샤오야");
    cout << "\n추가 후 해시 테이블\nKey -> Value" << endl;
    map.print();

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    string name = map.get(13276);
    cout << "\n학번 13276으로 조회한 이름: " << name << endl;

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(12836);
    cout << "\n키 12836 삭제 후 해시 테이블\nKey -> Value" << endl;
    map.print();

    return 0;
}
