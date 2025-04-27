/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver Code */
fun main() {
    /* 初始化列表 */
    // 可变集合
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("列表 nums = $nums")

    /* 访问元素 */
    val num = nums[1]
    println("访问索引 1 处的元素，得到 num = $num")

    /* 更新元素 */
    nums[1] = 0
    println("将索引 1 处的元素更新为 0 ，得到 nums = $nums")

    /* 清空列表 */
    nums.clear()
    println("清空列表后 nums = $nums")

    /* 在尾部添加元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("添加元素后 nums = $nums")

    /* 在中间插入元素 */
    nums.add(3, 6)
    println("在索引 3 处插入数字 6 ，得到 nums = $nums")

    /* 删除元素 */
    nums.removeAt(3)
    println("删除索引 3 处的元素，得到 nums = $nums")

    /* 通过索引遍历列表 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 直接遍历列表元素 */
    for (j in nums) {
        count += j
    }

    /* 拼接两个列表*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("将列表 nums1 拼接到 nums 之后，得到 nums = $nums")

    /* 排序列表 */
    nums.sort()
    println("排序列表后 nums = $nums")
}