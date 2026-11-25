/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 배열에서의 해시 탐색 */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // 해시 테이블의 key는 목표 원소, value는 인덱스다.
    // 해시 테이블에 해당 키가 없으면 -1을 반환한다.
    return map[target, default: -1]
}

/* 연결 리스트에서의 해시 탐색 */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // 해시 테이블의 key는 찾을 노드의 값, value는 노드 객체다.
    // 해시 테이블에 해당 키가 없으면 null을 반환한다.
    return map[target]
}

@main
enum HashingSearch {
    /* 실행 예제 */
    static func main() {
        let target = 3

        /* 배열에서의 해시 탐색 */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // 해시 테이블 초기화
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key는 원소, value는 인덱스다.
        }
        let index = hashingSearchArray(map: map, target: target)
        print("목표 원소 3의 인덱스 = \(index)")

        /* 연결 리스트에서의 해시 탐색 */
        var head = ListNode.arrToLinkedList(arr: nums)
        // 해시 테이블 초기화
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key는 노드의 값, value는 노드다.
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("값이 3인 목표 노드의 객체 = \(node!)")
    }
}
