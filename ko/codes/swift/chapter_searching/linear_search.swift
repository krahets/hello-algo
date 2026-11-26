/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 배열에서의 선형 탐색 */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // 배열을 순회한다.
    for i in nums.indices {
        // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
        if nums[i] == target {
            return i
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다.
    return -1
}

/* 연결 리스트에서의 선형 탐색 */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // 연결 리스트를 순회한다.
    while head != nil {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다.
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // 목표 노드를 찾지 못했으므로 null을 반환한다.
    return nil
}

@main
enum LinearSearch {
    /* 실행 예제 */
    static func main() {
        let target = 3

        /* 배열에서 선형 탐색 수행 */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("목표 원소 3의 인덱스 = \(index)")

        /* 연결 리스트에서 선형 탐색 수행 */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("값이 3인 목표 노드의 객체 = \(node!)")
    }
}
