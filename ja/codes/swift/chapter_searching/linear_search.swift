/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 線形探索（配列） */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // 配列を走査する
    for i in nums.indices {
        // 目標の要素が見つかったので、そのインデックスを返す
        if nums[i] == target {
            return i
        }
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1
}

/* 線形探索（連結リスト） */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // 連結リストを走査する
    while head != nil {
        // 目標ノードが見つかったので、そのノードを返す
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // 目標ノードが見つからなかったので null を返す
    return nil
}

@main
enum LinearSearch {
    /* 実行例 */
    static func main() {
        let target = 3

        /* 配列で線形探索を行う */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("目標値 3 のインデックス = \(index)")

        /* 連結リストで線形探索を行う */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("目標値 3 に対応するノードオブジェクトは \(node!)")
    }
}
