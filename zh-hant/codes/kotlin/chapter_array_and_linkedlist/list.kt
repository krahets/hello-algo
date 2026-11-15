/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver Code */
fun main() {
    /* 初始化串列 */
    // 可變集合
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("串列 nums = $nums")

    /* 訪問元素 */
    val num = nums[1]
    println("訪問索引 1 處的元素，得到 num = $num")

    /* 更新元素 */
    nums[1] = 0
    println("將索引 1 處的元素更新為 0 ，得到 nums = $nums")

    /* 清空串列 */
    nums.clear()
    println("清空串列後 nums = $nums")

    /* 在尾部新增元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("新增元素後 nums = $nums")

    /* 在中間插入元素 */
    nums.add(3, 6)
    println("在索引 3 處插入數字 6 ，得到 nums = $nums")

    /* 刪除元素 */
    nums.removeAt(3)
    println("刪除索引 3 處的元素，得到 nums = $nums")

    /* 透過索引走訪串列 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 直接走訪串列元素 */
    for (j in nums) {
        count += j
    }

    /* 拼接兩個串列*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("將串列 nums1 拼接到 nums 之後，得到 nums = $nums")

    /* 排序串列 */
    nums.sort()
    println("排序串列後 nums = $nums")
}