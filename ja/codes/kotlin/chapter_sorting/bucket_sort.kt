/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* バケットソート */
fun bucketSort(nums: FloatArray) {
    // k = n/2 個のバケットを初期化し、各バケットに 2 要素ずつ割り当てる想定とする
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. 配列要素を各バケットに振り分ける
    for (num in nums) {
        // 入力データの範囲は [0, 1) であり、num * k を用いてインデックス範囲 [0, k-1] に写像する
        val i = (num * k).toInt()
        // num をバケット i に追加
        buckets[i].add(num)
    }
    // 2. 各バケットをソートする
    for (bucket in buckets) {
        // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
        bucket.sort()
    }
    // 3. バケットを走査して結果を結合
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* Driver Code */
fun main() {
    // 入力データは範囲 [0, 1) の浮動小数点数とする
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("バケットソート完了後 nums = ${nums.contentToString()}")
}