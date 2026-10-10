/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hash search (array) */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // Hash table's key: target element, value: index
    // If this key does not exist in the hash table, return -1
    return map[target, default: -1]
}

/* Hash search (linked list) */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // Hash table key: target node value, value: node object
    // If key is not in hash table, return null
    return map[target]
}

@main
enum HashingSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* Hash search (array) */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // Initialize hash table
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key: element, value: index
        }
        let index = hashingSearchArray(map: map, target: target)
        print("Index of target element 3 = \(index)")

        /* Hash search (linked list) */
        var head = ListNode.arrToLinkedList(arr: nums)
        // Initialize hash table
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key: node value, value: node
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("Node object corresponding to target node value 3 is \(node!)")
    }
}
