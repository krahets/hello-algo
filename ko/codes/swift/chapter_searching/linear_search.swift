/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 선형 탐색(배열) */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // 배열 순회
    for i in nums.indices {
        // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        if nums[i] == target {
            return i
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다
    return -1
}

/* 선형 탐색(연결 리스트) */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // 연결 리스트 순회
    while head != nil {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // 목표 노드를 찾지 못했으므로 null을 반환한다
    return nil
}

@main
enum LinearSearch {
    /* 실행 코드 */
    static func main() {
        let target = 3

        /* 배열에서 선형 탐색을 수행한다 */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("목표 원소 3의 인덱스 = \(index)")

        /* 연결 리스트에서 선형 탐색을 수행한다 */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("목표 노드 값 3에 해당하는 노드 객체 = \(node!)")
    }
}
