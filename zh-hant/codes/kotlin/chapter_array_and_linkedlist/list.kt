/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 範例主程式 */
fun main() {
    /* 初始化列表 */
    // 可變集合
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("列表 nums = $nums")

    /* 存取元素 */
    val num = nums[1]
    println("存取索引 1 處的元素，得到 num = $num")

    /* 更新元素 */
    nums[1] = 0
    println("將索引 1 處的元素更新為 0，得到 nums = $nums")

    /* 清空列表 */
    nums.clear()
    println("清空列表後，nums = $nums")

    /* 在尾端加入元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("加入元素後，nums = $nums")

    /* 在中間插入元素 */
    nums.add(3, 6)
    println("在索引 3 處插入數字 6，得到 nums = $nums")

    /* 刪除元素 */
    nums.removeAt(3)
    println("刪除索引 3 處的元素，得到 nums = $nums")

    /* 依索引走訪列表 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 直接走訪列表中的元素 */
    for (j in nums) {
        count += j
    }

    /* 串接兩個列表*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("將列表 nums1 接在 nums 之後，得到 nums = $nums")

    /* 排序列表 */
    nums.sort()
    println("列表排序後，nums = $nums")
}