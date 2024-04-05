/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 雜湊查詢（陣列） */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // 雜湊表的 key: 目標元素，value: 索引
    // 若雜湊表中無此 key ，返回 -1
    return map[target, default: -1]
}

/* 雜湊查詢（鏈結串列） */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // 雜湊表的 key: 目標節點值，value: 節點物件
    // 若雜湊表中無此 key ，返回 null
    return map[target]
}

@main
enum HashingSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* 雜湊查詢（陣列） */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // 初始化雜湊表
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key: 元素，value: 索引
        }
        let index = hashingSearchArray(map: map, target: target)
        print("目標元素 3 的索引 = \(index)")

        /* 雜湊查詢（鏈結串列） */
        var head = ListNode.arrToLinkedList(arr: nums)
        // 初始化雜湊表
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key: 節點值，value: 節點
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("目標節點值 3 的對應節點物件為 \(node!)")
    }
}
