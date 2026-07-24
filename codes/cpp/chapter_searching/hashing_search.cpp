/**
 * File: hashing_search.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、传引用、避免拷贝、类型安全
 */

#include "../utils/common.hpp"
#include <vector>
#include <unordered_map>
#include <iostream>

/* 哈希查找（数组）*/
// 关键优化：const 引用传递，不拷贝、不修改
int hashingSearchArray(const std::unordered_map<int, int>& map, int target) {
    auto it = map.find(target);
    if (it == map.end())
        return -1;
    return it->second; // 更安全：不使用 []，避免插入默认值
}

/* 哈希查找（链表）*/
ListNode* hashingSearchLinkedList(const std::unordered_map<int, ListNode*>& map, int target) {
    auto it = map.find(target);
    if (it == end(map))
        return nullptr;
    return it->second;
}

/* Driver Code */
int main() {
    const int target = 3;

    /* 哈希查找（数组）*/
    std::vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    std::unordered_map<int, int> map;

    for (int i = 0; i < static_cast<int>(nums.size()); ++i) {
        map[nums[i]] = i;
    }

    int index = hashingSearchArray(map, target);
    std::cout << "目标元素 3 的索引 = " << index << '\n';

    /* 哈希查找（链表）*/
    ListNode* head = vecToLinkedList(nums);
    std::unordered_map<int, ListNode*> map1;

    ListNode* cur = head;
    while (cur != nullptr) {
        map1[cur->val] = cur;
        cur = cur->next;
    }

    ListNode* node = hashingSearchLinkedList(map1, target);
    std::cout << "目标节点值 3 的对应节点对象为 " << node << '\n';

    // 释放链表内存
    freeMemoryLinkedList(head);

    return 0;
}
