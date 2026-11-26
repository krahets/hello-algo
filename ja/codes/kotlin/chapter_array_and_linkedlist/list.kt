/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* ドライバコード */
fun main() {
    /* リストを初期化する */
    // 変更可能なコレクション
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("リスト nums = $nums")

    /* 要素にアクセスする */
    val num = nums[1]
    println("インデックス 1 の要素を読み出した結果 num = $num")

    /* 要素を更新する */
    nums[1] = 0
    println("インデックス 1 の要素を 0 に更新した後の nums = $nums")

    /* リストを空にする */
    nums.clear()
    println("リストを空にした後の nums = $nums")

    /* 末尾に要素を追加する */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("要素追加後の nums = $nums")

    /* 途中に要素を挿入する */
    nums.add(3, 6)
    println("インデックス 3 に 6 を挿入した後の nums = $nums")

    /* 要素を削除する */
    nums.removeAt(3)
    println("インデックス 3 の要素を削除した後の nums = $nums")

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
    println("リスト nums1 を nums の末尾に連結した後の nums = $nums")

    /* リストをソートする */
    nums.sort()
    println("ソート後のリスト nums = $nums")
}