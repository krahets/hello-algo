/*
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

/* 哈希查找（数组） */
int hashingSearch(unordered_map<int, int> map, int target) {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* 哈希查找（链表） */
ListNode* hashingSearch1(unordered_map<int, ListNode*> map, int target) {
    // 哈希表的 key: 目标结点值，value: 结点对象
    // 若哈希表中无此 key ，返回 nullptr
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}


/* Driver Code */
int main() {
    int target = 3;

    /* 哈希查找（数组） */
    vector<int> nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
    // 初始化哈希表
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i;  // key: 元素，value: 索引
    }
    int index = hashingSearch(map, target);
    cout << "目标元素 3 的索引 = " << index << endl;

    /* 哈希查找（链表） */
    ListNode* head = vectorToLinkedList(nums);
    // 初始化哈希表
    unordered_map<int, ListNode*> map1;
    while (head != nullptr) {
        map1[head->val] = head;  // key: 结点值，value: 结点
        head = head->next;
    }
    ListNode* node = hashingSearch1(map1, target);
    cout << "目标结点值 3 的对应结点对象为 " << node << endl;

    return 0;
}
