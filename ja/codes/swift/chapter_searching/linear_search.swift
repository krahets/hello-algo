/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 線形探索（配列） */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // 配列を走査
    for i in nums.indices {
        // 目標要素が見つかったらそのインデックスを返す
        if nums[i] == target {
            return i
        }
    }
    // 目標要素が見つからなければ -1 を返す
    return -1
}

/* 線形探索（連結リスト） */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // 連結リストを走査
    while head != nil {
        // 対象ノードが見つかったら、それを返す
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // 対象ノードが見つからない場合は null を返す
    return nil
}

@main
enum LinearSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* 配列で線形探索を行う */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("目標要素 3 のインデックス = \(index)")

        /* 連結リストで線形探索を行う */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("目標ノード値 3 に対応するノードオブジェクトは \(node!)")
    }
}
