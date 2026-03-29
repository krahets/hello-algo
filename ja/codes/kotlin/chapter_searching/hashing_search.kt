/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* ハッシュ探索（配列） */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // ハッシュテーブルの key: 対象要素、_val: インデックス
    // ハッシュテーブルにその key がなければ -1 を返す
    return map.getOrDefault(target, -1)
}

/* ハッシュ探索（連結リスト） */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // ハッシュテーブルの key: 対象ノードの値、_val: ノードオブジェクト
    // ハッシュテーブルにその key がなければ null を返す
    return map.getOrDefault(target, null)
}

/* Driver Code */
fun main() {
    val target = 3

    /* ハッシュ探索（配列） */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // ハッシュテーブルを初期化
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key: 要素、_val: インデックス
    }
    val index = hashingSearchArray(map, target)
    println("目標要素 3 のインデックス = $index")

    /* ハッシュ探索（連結リスト） */
    var head = ListNode.arrToLinkedList(nums)
    // ハッシュテーブルを初期化
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key: ノード値、_val: ノード
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("目標ノード値 3 に対応するノードオブジェクトは $node")
}