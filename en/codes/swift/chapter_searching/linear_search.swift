/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Linear search (array) */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // Traverse the array
    for i in nums.indices {
        // The target element was found; return its index
        if nums[i] == target {
            return i
        }
    }
    // The target element was not found; return -1
    return -1
}

/* Linear search (linked list) */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // Traverse the linked list
    while head != nil {
        // The target node was found; return it
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // The target node was not found; return nil
    return nil
}

@main
enum LinearSearch {
    /* Driver code */
    static func main() {
        let target = 3

        /* Perform linear search on the array */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("Index of target element 3 = \(index)")

        /* Perform linear search on the linked list */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("Node object with target value 3: \(node!)")
    }
}
