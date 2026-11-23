/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* ハッシュ探索（配列） */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // ハッシュテーブルの key：目的の要素、value：インデックス
    // ハッシュテーブルにこの key が存在しない場合、-1 を返す
    return map[target, default: -1]
}

/* ハッシュ探索（連結リスト） */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // ハッシュテーブルの key：目的のノードの値、value：ノードオブジェクト
    // ハッシュテーブルにこの key が存在しない場合、null を返す
    return map[target]
}

@main
enum HashingSearch {
    /* 実行用コード */
    static func main() {
        let target = 3

        /* ハッシュ探索（配列） */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // ハッシュテーブルを初期化する
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key：要素、value：インデックス
        }
        let index = hashingSearchArray(map: map, target: target)
        print("目的の要素 3 のインデックス = \(index)")

        /* ハッシュ探索（連結リスト） */
        var head = ListNode.arrToLinkedList(arr: nums)
        // ハッシュテーブルを初期化する
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key：ノードの値、value：ノード
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("目的のノードの値 3 に対応するノードオブジェクトは \(node!)")
    }
}
