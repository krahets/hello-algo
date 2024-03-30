/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* 随机访问元素 */
fun randomAccess(nums: IntArray): Int {
    // 在区间 [0, nums.size) 中随机抽取一个数字
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // 获取并返回随机元素
    val randomNum = nums[randomIndex]
    return randomNum
}

/* 扩展数组长度 */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // 初始化一个扩展长度后的数组
    val res = IntArray(nums.size + enlarge)
    // 将原数组中的所有元素复制到新数组
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // 返回扩展后的新数组
    return res
}

/* 在数组的索引 index 处插入元素 num */
fun insert(nums: IntArray, num: Int, index: Int) {
    // 把索引 index 以及之后的所有元素向后移动一位
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num
}

/* 删除索引 index 处的元素 */
fun remove(nums: IntArray, index: Int) {
    // 把索引 index 之后的所有元素向前移动一位
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* 遍历数组 */
fun traverse(nums: IntArray) {
    var count = 0
    // 通过索引遍历数组
    for (i in nums.indices) {
        count += nums[i]
    }
    // 直接遍历数组元素
    for (j in nums) {
        count += j
    }
}

/* 在数组中查找指定元素 */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    /* 初始化数组 */
    val arr = IntArray(5)
    println("数组 arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("数组 nums = ${nums.contentToString()}")

    /* 随机访问 */
    val randomNum: Int = randomAccess(nums)
    println("在 nums 中获取随机元素 $randomNum")

    /* 长度扩展 */
    nums = extend(nums, 3)
    println("将数组长度扩展至 8 ，得到 nums = ${nums.contentToString()}")

    /* 插入元素 */
    insert(nums, 6, 3)
    println("在索引 3 处插入数字 6 ，得到 nums = ${nums.contentToString()}")

    /* 删除元素 */
    remove(nums, 2)
    println("删除索引 2 处的元素，得到 nums = ${nums.contentToString()}")

    /* 遍历数组 */
    traverse(nums)

    /* 查找元素 */
    val index: Int = find(nums, 3)
    println("在 nums 中查找元素 3 ，得到索引 = $index")
}