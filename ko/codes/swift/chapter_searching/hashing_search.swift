/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 해시 탐색(배열) */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // 해시 테이블의 key: 목표 원소, value: 인덱스
    // 해시 테이블에 해당 key가 없으면 -1을 반환한다
    return map[target, default: -1]
}

/* 해시 탐색(연결 리스트) */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
    // 해시 테이블에 해당 key가 없으면 null을 반환한다
    return map[target]
}

@main
enum HashingSearch {
    /* 실행 코드 */
    static func main() {
        let target = 3

        /* 해시 탐색(배열) */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // 해시 테이블 초기화
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key: 원소, value: 인덱스
        }
        let index = hashingSearchArray(map: map, target: target)
        print("목표 원소 3의 인덱스 = \(index)")

        /* 해시 탐색(연결 리스트) */
        var head = ListNode.arrToLinkedList(arr: nums)
        // 해시 테이블 초기화
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key: 노드 값, value: 노드
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("목표 노드 값 3에 해당하는 노드 객체 = \(node!)")
    }
}
