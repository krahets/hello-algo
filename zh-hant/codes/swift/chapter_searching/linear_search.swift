/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 循序搜尋（陣列） */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // 走訪陣列
    for i in nums.indices {
        // 找到目標元素，回傳其索引
        if nums[i] == target {
            return i
        }
    }
    // 找不到目標元素，回傳 -1
    return -1
}

/* 循序搜尋（鏈結串列） */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // 走訪鏈結串列
    while head != nil {
        // 找到目標節點，回傳該節點
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // 找不到目標節點，回傳 null
    return nil
}

@main
enum LinearSearch {
    /* 主程式 */
    static func main() {
        let target = 3

        /* 在陣列中執行循序搜尋 */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("目標元素 3 的索引 = \(index)")

        /* 在鏈結串列中執行循序搜尋 */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("目標值 3 對應的節點物件為 \(node!)")
    }
}
