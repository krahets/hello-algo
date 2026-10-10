/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver Code */
fun main() {
    /* リストを初期化 */
    // 可変集合
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("リスト nums = $nums")

    /* 要素にアクセス */
    val num = nums[1]
    println("インデックス 1 の要素にアクセスし，num = $num")

    /* 要素を更新 */
    nums[1] = 0
    println("インデックス 1 の要素を 0 に更新し，nums = $nums")

    /* リストを空にする */
    nums.clear()
    println("リストを空にした後の nums = $nums")

    /* 末尾に要素を追加 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("要素追加後の nums = $nums")

    /* 中間に要素を挿入 */
    nums.add(3, 6)
    println("インデックス 3 に数値 6 を挿入し，nums = $nums")

    /* 要素を削除 */
    nums.removeAt(3)
    println("インデックス 3 の要素を削除し，nums = $nums")

    /* インデックスでリストを走査 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* リスト要素を直接走査 */
    for (j in nums) {
        count += j
    }

    /* 2 つのリストを連結する */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("リスト nums1 を nums の後ろに連結し，nums = $nums")

    /* リストをソート */
    nums.sort()
    println("リストをソートした後の nums = $nums")
}