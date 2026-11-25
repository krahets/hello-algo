/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* 실행 예제 */
int main() {
    /* 해시 테이블 초기화 */
    unordered_map<int, string> map;

    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map[12836] = "샤오하";
    map[15937] = "샤오뤄";
    map[16750] = "샤오쑤안";
    map[13276] = "샤오파";
    map[10583] = "샤오야";
    cout << "\n추가 후 해시 테이블\nKey -> Value" << endl;
    printHashMap(map);

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    string name = map[15937];
    cout << "\n학번 15937로 조회한 이름: " << name << endl;

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.erase(10583);
    cout << "\n키 10583 삭제 후 해시 테이블\nKey -> Value" << endl;
    printHashMap(map);

    /* 해시 테이블 순회 */
    cout << "\n키-값 쌍 순회 Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\n반복자로 키-값 쌍 순회 Key->Value" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
