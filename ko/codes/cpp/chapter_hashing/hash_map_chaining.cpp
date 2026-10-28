/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* 체이닝 해시 테이블 */
class HashMapChaining {
  private:
    int size;                       // 키-값 쌍 개수
    int capacity;                   // 해시 테이블 용량
    double loadThres;               // 용량 확장을 수행하는 적재율 임계값
    int extendRatio;                // 용량 확장 배수
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

    /* 조회 연산 */
    string get(int key) {
        int index = hashFunc(key);
        // 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // key를 찾지 못하면 빈 문자열을 반환한다
        return "";
    }

    /* 추가 연산 */
    void put(int key, string val) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* 삭제 연산 */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // 버킷을 순회하며 키-값 쌍을 삭제한다
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // 해당 키-값 쌍을 삭제한다
                delete tmp;                       // 메모리 해제
                size--;
                return;
            }
        }
    }

    /* 해시 테이블 용량 확장 */
    void extend() {
        // 원래 해시 테이블을 임시로 저장한다
        vector<vector<Pair *>> bucketsTmp = buckets;
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

/* 실행 코드 */
int main() {
    /* 해시 테이블 초기화 */
    HashMapChaining map = HashMapChaining();

    /* 추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    cout << "\n추가를 마친 후의 해시 테이블\n키 -> 값" << endl;
    map.print();

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    string name = map.get(13276);
    cout << "\n학번 13276을 입력하여 조회한 이름 " << name << endl;

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(12836);
    cout << "\n12836을 삭제한 뒤의 해시 테이블\n키 -> 값" << endl;
    map.print();

    return 0;
}
