/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* ハッシュ探索（配列） */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // ハッシュテーブルのキーは目標の要素、値はインデックス
    // このキーがハッシュテーブルになければ -1 を返す
    return map[target, default: -1]
}

/* ハッシュ探索（連結リスト） */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // ハッシュテーブルのキーは目標ノードの値、値はノードオブジェクト
    // このキーがハッシュテーブルになければ null を返す
    return map[target]
}

@main
enum HashingSearch {
    /* 実行例 */
    static func main() {
        let target = 3

        /* ハッシュ探索（配列） */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // ハッシュテーブルを初期化する
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // キーは要素、値はインデックス
        }
        let index = hashingSearchArray(map: map, target: target)
        print("目標値 3 のインデックス = \(index)")

        /* ハッシュ探索（連結リスト） */
        var head = ListNode.arrToLinkedList(arr: nums)
        // ハッシュテーブルを初期化する
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // キーはノードの値、値はノード
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("目標値 3 に対応するノードオブジェクトは \(node!)")
    }
}
