/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* 실행 코드 */
int main() {
    /* 해시 테이블 초기화 */
    ArrayHashMap map = ArrayHashMap();

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
    string name = map.get(15937);
    cout << "\n학번 15937을 입력하여 조회한 이름 " << name << endl;

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.remove(10583);
    cout << "\n10583을 삭제한 후의 해시 테이블\n키 -> 값" << endl;
    map.print();

    /* 해시 테이블 순회 */
    cout << "\n키-값 쌍(키->값) 순회" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\n키 Key만 순회" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\n값 Value만 순회" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
