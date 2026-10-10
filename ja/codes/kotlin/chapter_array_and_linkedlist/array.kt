/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* 要素へランダムアクセス */
fun randomAccess(nums: IntArray): Int {
    // 区間 [0, nums.size) からランダムに数字を 1 つ選ぶ
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // ランダムな要素を取得して返す
    val randomNum = nums[randomIndex]
    return randomNum
}

/* 配列長を拡張する */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // 拡張後の長さを持つ配列を初期化する
    val res = IntArray(nums.size + enlarge)
    // 元の配列の全要素を新しい配列にコピー
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // 拡張後の新しい配列を返す
    return res
}

/* 配列の index 番目に要素 num を挿入 */
fun insert(nums: IntArray, num: Int, index: Int) {
    // インデックス index 以降の全要素を 1 つ後ろへ移動する
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // index の要素に num を代入する
    nums[index] = num
}

/* index の要素を削除する */
fun remove(nums: IntArray, index: Int) {
    // インデックス index より後ろの全要素を 1 つ前へ移動する
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* 配列を走査 */
fun traverse(nums: IntArray) {
    var count = 0
    // インデックスで配列を走査
    for (i in nums.indices) {
        count += nums[i]
    }
    // 配列要素を直接走査
    for (j in nums) {
        count += j
    }
}

/* 配列内で指定要素を探す */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    /* 配列を初期化 */
    val arr = IntArray(5)
    println("配列 arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("配列 nums = ${nums.contentToString()}")

    /* ランダムアクセス */
    val randomNum: Int = randomAccess(nums)
    println("nums からランダムな要素 $randomNum を取得")

    /* 長さを拡張 */
    nums = extend(nums, 3)
    println("配列の長さを 8 まで拡張し，nums = ${nums.contentToString()}")

    /* 要素を挿入する */
    insert(nums, 6, 3)
    println("インデックス 3 に数値 6 を挿入し，nums = ${nums.contentToString()}")

    /* 要素を削除 */
    remove(nums, 2)
    println("インデックス 2 の要素を削除し，nums = ${nums.contentToString()}")

    /* 配列を走査 */
    traverse(nums)

    /* 要素を探索する */
    val index: Int = find(nums, 3)
    println("nums 内で要素 3 を検索し，インデックス = $index")
}