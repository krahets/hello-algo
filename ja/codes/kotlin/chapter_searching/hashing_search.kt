/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* ハッシュ探索（配列） */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // ハッシュテーブルの key：目的の要素、_val：インデックス
    // ハッシュテーブルにこの key が存在しない場合、-1 を返す
    return map.getOrDefault(target, -1)
}

/* ハッシュ探索（連結リスト） */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // ハッシュテーブルの key：目的のノードの値、_val：ノードオブジェクト
    // ハッシュテーブルにこの key が存在しない場合、null を返す
    return map.getOrDefault(target, null)
}

/* 実行用コード */
fun main() {
    val target = 3

    /* ハッシュ探索（配列） */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // ハッシュテーブルを初期化する
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key：要素、_val：インデックス
    }
    val index = hashingSearchArray(map, target)
    println("目的の要素 3 のインデックス = $index")

    /* ハッシュ探索（連結リスト） */
    var head = ListNode.arrToLinkedList(nums)
    // ハッシュテーブルを初期化する
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key：ノードの値、_val：ノード
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("目的のノードの値 3 に対応するノードオブジェクトは $node")
}