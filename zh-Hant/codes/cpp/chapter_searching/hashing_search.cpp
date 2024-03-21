/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 哈希查找（数组） */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* 哈希查找（链表） */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // 哈希表的 key: 目标节点值，value: 节点对象
    // 若哈希表中无此 key ，返回 nullptr
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Driver Code */
int main() {
    int target = 3;

    /* 哈希查找（数组） */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // 初始化哈希表
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key: 元素，value: 索引
    }
    int index = hashingSearchArray(map, target);
    cout << "目标元素 3 的索引 = " << index << endl;

    /* 哈希查找（链表） */
    ListNode *head = vecToLinkedList(nums);
    // 初始化哈希表
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key: 节点值，value: 节点
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "目标节点值 3 的对应节点对象为 " << node << endl;

    return 0;
}
