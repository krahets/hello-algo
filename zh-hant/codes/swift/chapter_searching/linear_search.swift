/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 線性查詢（陣列） */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // 走訪陣列
    for i in nums.indices {
        // 找到目標元素，返回其索引
        if nums[i] == target {
            return i
        }
    }
    // 未找到目標元素，返回 -1
    return -1
}

/* 線性查詢（鏈結串列） */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // 走訪鏈結串列
    while head != nil {
        // 找到目標節點，返回之
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // 未找到目標節點，返回 null
    return nil
}

@main
enum LinearSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* 在陣列中執行線性查詢 */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("目標元素 3 的索引 = \(index)")

        /* 在鏈結串列中執行線性查詢 */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("目標節點值 3 的對應節點物件為 \(node!)")
    }
}
