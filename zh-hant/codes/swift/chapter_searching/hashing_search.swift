/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 雜湊搜尋（陣列） */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // 雜湊表的 key 為目標元素，value 為索引
    // 若雜湊表中沒有這個 key，則回傳 -1
    return map[target, default: -1]
}

/* 雜湊搜尋（鏈結串列） */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // 雜湊表的 key 為目標節點的值，value 為節點物件
    // 若雜湊表中沒有這個 key，則回傳 null
    return map[target]
}

@main
enum HashingSearch {
    /* 主程式 */
    static func main() {
        let target = 3

        /* 雜湊搜尋（陣列） */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // 初始化雜湊表
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key 為元素，value 為索引
        }
        let index = hashingSearchArray(map: map, target: target)
        print("目標元素 3 的索引 = \(index)")

        /* 雜湊搜尋（鏈結串列） */
        var head = ListNode.arrToLinkedList(arr: nums)
        // 初始化雜湊表
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key 為節點的值，value 為節點
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("目標值 3 對應的節點物件為 \(node!)")
    }
}
