/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* 隨機存取元素 */
fun randomAccess(nums: IntArray): Int {
    // 從區間 [0, nums.size) 隨機選取一個數
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // 取得並回傳隨機選出的元素
    val randomNum = nums[randomIndex]
    return randomNum
}

/* 增加陣列長度 */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // 初始化加長後的陣列
    val res = IntArray(nums.size + enlarge)
    // 將原陣列的所有元素複製到新陣列
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // 回傳加長後的新陣列
    return res
}

/* 在陣列的索引 index 處插入元素 num */
fun insert(nums: IntArray, num: Int, index: Int) {
    // 將索引 index 起的所有元素往後移一格
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // 將 num 指派給索引 index 處的元素
    nums[index] = num
}

/* 刪除索引 index 處的元素 */
fun remove(nums: IntArray, index: Int) {
    // 將索引 index 之後的所有元素往前移一格
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* 走訪陣列 */
fun traverse(nums: IntArray) {
    var count = 0
    // 依索引走訪陣列
    for (i in nums.indices) {
        count += nums[i]
    }
    // 直接走訪陣列中的元素
    for (j in nums) {
        count += j
    }
}

/* 在陣列中尋找指定元素 */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* 範例主程式 */
fun main() {
    /* 初始化陣列 */
    val arr = IntArray(5)
    println("陣列 arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("陣列 nums = ${nums.contentToString()}")

    /* 隨機存取 */
    val randomNum: Int = randomAccess(nums)
    println("從 nums 隨機取得的元素為 $randomNum")

    /* 增加長度 */
    nums = extend(nums, 3)
    println("將陣列長度增加至 8，得到 nums = ${nums.contentToString()}")

    /* 插入元素 */
    insert(nums, 6, 3)
    println("在索引 3 處插入數字 6，得到 nums = ${nums.contentToString()}")

    /* 刪除元素 */
    remove(nums, 2)
    println("刪除索引 2 處的元素，得到 nums = ${nums.contentToString()}")

    /* 走訪陣列 */
    traverse(nums)

    /* 尋找元素 */
    val index: Int = find(nums, 3)
    println("在 nums 中尋找元素 3，得到索引 = $index")
}