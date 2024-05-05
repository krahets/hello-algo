/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Linear search (array) */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // Traverse array
    for i in nums.indices {
        // Found the target element, thus return its index
        if nums[i] == target {
            return i
        }
    }
    // Did not find the target element, thus return -1
    return -1
}

/* Linear search (linked list) */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // Traverse the list
    while head != nil {
        // Found the target node, return it
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // If the target node is not found, return null
    return nil
}

@main
enum LinearSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* Perform linear search in array */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("Index of target element 3 = \(index)")

        /* Perform linear search in linked list */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("The corresponding node object for target node value 3 is \(node!)")
    }
}
