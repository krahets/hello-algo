/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 哈希查找（数组） */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1
    return map[target, default: -1]
}

/* 哈希查找（链表） */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // 哈希表的 key: 目标节点值，value: 节点对象
    // 若哈希表中无此 key ，返回 null
    return map[target]
}

@main
enum HashingSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* 哈希查找（数组） */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // 初始化哈希表
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key: 元素，value: 索引
        }
        let index = hashingSearchArray(map: map, target: target)
        print("目标元素 3 的索引 = \(index)")

        /* 哈希查找（链表） */
        var head = ListNode.arrToLinkedList(arr: nums)
        // 初始化哈希表
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key: 节点值，value: 节点
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("目标节点值 3 的对应节点对象为 \(node!)")
    }
}
