/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 线性查找（数组） */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // 遍历数组
    for i in nums.indices {
        // 找到目标元素，返回其索引
        if nums[i] == target {
            return i
        }
    }
    // 未找到目标元素，返回 -1
    return -1
}

/* 线性查找（链表） */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // 遍历链表
    while head != nil {
        // 找到目标节点，返回之
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // 未找到目标节点，返回 null
    return nil
}

@main
enum LinearSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* 在数组中执行线性查找 */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("目标元素 3 的索引 = \(index)")

        /* 在链表中执行线性查找 */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("目标节点值 3 的对应节点对象为 \(node!)")
    }
}
