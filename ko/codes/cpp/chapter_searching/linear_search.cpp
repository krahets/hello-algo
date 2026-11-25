/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 배열에서의 선형 탐색 */
int linearSearchArray(vector<int> &nums, int target) {
    // 배열을 순회한다.
    for (int i = 0; i < nums.size(); i++) {
        // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
        if (nums[i] == target)
            return i;
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다.
    return -1;
}

/* 연결 리스트에서의 선형 탐색 */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // 연결 리스트를 순회한다.
    while (head != nullptr) {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다.
        if (head->val == target)
            return head;
        head = head->next;
    }
    // 목표 노드를 찾지 못했으므로 nullptr를 반환한다.
    return nullptr;
}

/* 실행 예제 */
int main() {
    int target = 3;

    /* 배열에서 선형 탐색 수행 */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "목표 원소 3의 인덱스 = " << index << endl;

    /* 연결 리스트에서 선형 탐색 수행 */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "값이 3인 목표 노드의 객체 = " << node << endl;

    return 0;
}
