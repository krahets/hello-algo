/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Linear search in an array */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // Traverse the array
    for i in nums.indices {
        // Found the target. Return its index
        if nums[i] == target {
            return i
        }
    }
    // Target not found. Return -1
    return -1
}

/* Linear search in a linked list */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // Traverse the linked list
    while head != nil {
        // Found the target node. Return it
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // Target node not found. Return null
    return nil
}

@main
enum LinearSearch {
    /* Driver code */
    static func main() {
        let target = 3

        /* Run linear search on the array */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("Index of target 3 = \(index)")

        /* Run linear search on the linked list */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("Node object for target value 3 = \(node!)")
    }
}
