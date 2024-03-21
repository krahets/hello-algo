/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 雜湊查詢（陣列） */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // 雜湊表的 key: 目標元素，value: 索引
    // 若雜湊表中無此 key ，返回 -1
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* 雜湊查詢（鏈結串列） */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // 雜湊表的 key: 目標節點值，value: 節點物件
    // 若雜湊表中無此 key ，返回 nullptr
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Driver Code */
int main() {
    int target = 3;

    /* 雜湊查詢（陣列） */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // 初始化雜湊表
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key: 元素，value: 索引
    }
    int index = hashingSearchArray(map, target);
    cout << "目標元素 3 的索引 = " << index << endl;

    /* 雜湊查詢（鏈結串列） */
    ListNode *head = vecToLinkedList(nums);
    // 初始化雜湊表
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key: 節點值，value: 節點
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "目標節點值 3 的對應節點物件為 " << node << endl;

    return 0;
}
