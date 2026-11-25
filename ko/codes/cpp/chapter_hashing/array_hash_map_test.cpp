/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* 실행 예제 */
int main() {
    /* 해시 테이블 초기화 */
    ArrayHashMap map = ArrayHashMap();

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
    string name = map.get(15937);
    cout << "\n학번 15937로 조회한 이름: " << name << endl;

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(10583);
    cout << "\n키 10583 삭제 후 해시 테이블\nKey -> Value" << endl;
    map.print();

    /* 해시 테이블 순회 */
    cout << "\n키-값 쌍 순회 Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\n키만 순회 Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\n값만 순회 Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
