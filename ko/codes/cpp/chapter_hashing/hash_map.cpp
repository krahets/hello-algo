/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    /* 해시 테이블 초기화 */
    unordered_map<int, string> map;

    /* 추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    cout << "\n추가를 마친 후의 해시 테이블\n키 -> 값" << endl;
    printHashMap(map);

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    string name = map[15937];
    cout << "\n학번 15937을 입력하여 조회한 이름 " << name << endl;

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    map.erase(10583);
    cout << "\n10583을 삭제한 후의 해시 테이블\n키 -> 값" << endl;
    printHashMap(map);

    /* 해시 테이블 순회 */
    cout << "\n키-값 쌍(키->값) 순회" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\n반복자로 키->값 순회" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
