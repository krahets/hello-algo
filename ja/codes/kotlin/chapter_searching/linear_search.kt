/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 線形探索（配列） */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // 配列を走査
    for (i in nums.indices) {
        // 目標要素が見つかったらそのインデックスを返す
        if (nums[i] == target)
            return i
    }
    // 目標要素が見つからなければ -1 を返す
    return -1
}

/* 線形探索（連結リスト） */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // 連結リストを走査
    var head = h
    while (head != null) {
        // 対象ノードが見つかったら、それを返す
        if (head._val == target)
            return head
        head = head.next
    }
    // 対象ノードが見つからない場合は null を返す
    return null
}

/* Driver Code */
fun main() {
    val target = 3

    /* 配列で線形探索を行う */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("目標要素 3 のインデックス = $index")

    /* 連結リストで線形探索を行う */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("目標ノード値 3 に対応するノードオブジェクトは $node")
}