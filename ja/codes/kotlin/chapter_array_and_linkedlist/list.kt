/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 実行用コード */
fun main() {
    /* リストを初期化する */
    // 変更可能なコレクション
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("リスト nums = $nums")

    /* 要素にアクセスする */
    val num = nums[1]
    println("インデックス 1 の要素にアクセスした結果 num = $num")

    /* 要素を更新する */
    nums[1] = 0
    println("インデックス 1 の要素を 0 に更新した結果 nums = $nums")

    /* リストを空にする */
    nums.clear()
    println("リストを空にした後 nums = $nums")

    /* 末尾に要素を追加する */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("要素を追加した後 nums = $nums")

    /* 途中に要素を挿入する */
    nums.add(3, 6)
    println("インデックス 3 に数値 6 を挿入した結果 nums = $nums")

    /* 要素を削除する */
    nums.removeAt(3)
    println("インデックス 3 の要素を削除した結果 nums = $nums")

    /* インデックスを使ってリストを走査する */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* リストの要素を直接走査する */
    for (j in nums) {
        count += j
    }

    /* 2 つのリストを連結する*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("リスト nums の後ろに nums1 を連結した結果 nums = $nums")

    /* リストをソートする */
    nums.sort()
    println("リストをソートした後 nums = $nums")
}