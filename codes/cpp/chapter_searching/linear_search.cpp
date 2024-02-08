/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 线性查找（数组） */
int linearSearchArray(vector<int> &nums, int target) {
    // 遍历数组
    for (int i = 0; i < nums.size(); i++) {
        // 找到目标元素，返回其索引
        if (nums[i] == target)
            return i;
    }
    // 未找到目标元素，返回 -1
    return -1;
}

/* 线性查找（链表） */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // 遍历链表
    while (head != nullptr) {
        // 找到目标节点，返回之
        if (head->val == target)
            return head;
        head = head->next;
    }
    // 未找到目标节点，返回 nullptr
    return nullptr;
}

/* Driver Code */
int main() {
    int target = 3;

    /* 在数组中执行线性查找 */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "目标元素 3 的索引 = " << index << endl;

    /* 在链表中执行线性查找 */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "目标节点值 3 的对应节点对象为 " << node << endl;

    return 0;
}
