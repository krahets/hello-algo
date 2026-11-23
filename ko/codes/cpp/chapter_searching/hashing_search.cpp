/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 해시 탐색(배열) */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // 해시 테이블의 key: 목표 원소, value: 인덱스
    // 해시 테이블에 해당 key가 없으면 -1을 반환한다
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* 해시 탐색(연결 리스트) */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
    // 해시 테이블에 해당 key가 없으면 nullptr를 반환한다
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* 실행 코드 */
int main() {
    int target = 3;

    /* 해시 탐색(배열) */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // 해시 테이블 초기화
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key: 원소, value: 인덱스
    }
    int index = hashingSearchArray(map, target);
    cout << "목표 원소 3의 인덱스 = " << index << endl;

    /* 해시 탐색(연결 리스트) */
    ListNode *head = vecToLinkedList(nums);
    // 해시 테이블 초기화
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key: 노드 값, value: 노드
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "목표 노드 값 3에 해당하는 노드 객체 " << node << endl;

    return 0;
}
