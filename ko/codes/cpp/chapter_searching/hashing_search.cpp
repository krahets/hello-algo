/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 배열에서의 해시 탐색 */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // 해시 테이블의 key는 목표 원소, value는 인덱스다.
    // 해시 테이블에 해당 키가 없으면 -1을 반환한다.
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* 연결 리스트에서의 해시 탐색 */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // 해시 테이블의 key는 찾을 노드의 값, value는 노드 객체다.
    // 해시 테이블에 해당 키가 없으면 nullptr를 반환한다.
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* 실행 예제 */
int main() {
    int target = 3;

    /* 배열에서의 해시 탐색 */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // 해시 테이블 초기화
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key는 원소, value는 인덱스다.
    }
    int index = hashingSearchArray(map, target);
    cout << "목표 원소 3의 인덱스 = " << index << endl;

    /* 연결 리스트에서의 해시 탐색 */
    ListNode *head = vecToLinkedList(nums);
    // 해시 테이블 초기화
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key는 노드의 값, value는 노드다.
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "값이 3인 목표 노드의 객체 = " << node << endl;

    return 0;
}
