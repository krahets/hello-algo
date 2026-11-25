/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 循序搜尋（陣列） */
int linearSearchArray(vector<int> &nums, int target) {
    // 走訪陣列
    for (int i = 0; i < nums.size(); i++) {
        // 找到目標元素，回傳其索引
        if (nums[i] == target)
            return i;
    }
    // 找不到目標元素，回傳 -1
    return -1;
}

/* 循序搜尋（鏈結串列） */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // 走訪鏈結串列
    while (head != nullptr) {
        // 找到目標節點，回傳該節點
        if (head->val == target)
            return head;
        head = head->next;
    }
    // 找不到目標節點，回傳 nullptr
    return nullptr;
}

/* 主程式 */
int main() {
    int target = 3;

    /* 在陣列中執行循序搜尋 */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "目標元素 3 的索引 = " << index << endl;

    /* 在鏈結串列中執行循序搜尋 */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "目標值 3 對應的節點物件為 " << node << endl;

    return 0;
}
