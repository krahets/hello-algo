/**
 * File: linear_search.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++规范、const修饰、类型安全、代码健壮优化
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 线性查找（数组） */
int linearSearchArray(const std::vector<int>& nums, int target)
{
    int n = static_cast<int>(nums.size());
    for (int i = 0; i < n; ++i)
    {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* 线性查找（链表） */
ListNode* linearSearchLinkedList(const ListNode* head, int target)
{
    const ListNode* cur = head;
    while (cur != nullptr)
    {
        if (cur->val == target)
            // 常量指针转为普通指针适配返回
            return const_cast<ListNode*>(cur);
        cur = cur->next;
    }
    return nullptr;
}

/* Driver Code */
int main()
{
    const int target = 3;

    // 数组线性查找
    std::vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    std::cout << "目标元素 3 的索引 = " << index << '\n';

    // 链表线性查找
    ListNode* head = vecToLinkedList(nums);
    ListNode* node = linearSearchLinkedList(head, target);
    std::cout << "目标节点值 3 的对应节点对象为 " << node << '\n';

    // 释放链表内存，避免内存泄漏
    freeMemoryLinkedList(head);

    return 0;
}
