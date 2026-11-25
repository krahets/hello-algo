/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Hash lookup in an array */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // Hash table key: target element, value: index
    // Return -1 if the key is absent
    return map[target, default: -1]
}

/* Hash lookup in a linked list */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // Hash table key: target node value, value: node object
    // Return null if the key is absent
    return map[target]
}

@main
enum HashingSearch {
    /* Driver code */
    static func main() {
        let target = 3

        /* Hash lookup in an array */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // Initialize the hash table
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key: element, value: index
        }
        let index = hashingSearchArray(map: map, target: target)
        print("Index of target 3 = \(index)")

        /* Hash lookup in a linked list */
        var head = ListNode.arrToLinkedList(arr: nums)
        // Initialize the hash table
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key: node value, value: node
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("Node object for target value 3 = \(node!)")
    }
}
