/**
 * File: array_test.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_array_and_linkedlist

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testArray() {
    /* 初始化数组 */
    let arr = Array<Int64>(5, item: 0)
    println("数组 arr = ${arr}")

    var nums = [1, 3, 2, 5, 4]
    println("数组 nums = ${nums}")

    /* 随机访问 */
    let randomNum = randomAccess(nums)
    println("在 nums 中获取随机元素 ${randomNum}")

    /* 长度扩展 */
    nums = `extend`(nums, 3)
    println("将数组长度扩展至 8 ，得到 nums = ${nums}")

    /* 插入元素 */
    insert(nums, 6, 3)
    println("在索引 3 处插入数字 6 ，得到 nums = ${nums}")

    /* 删除元素 */
    remove(nums, 2)
    println("删除索引 2 处的元素，得到 nums = ${nums}")

    /* 遍历数组 */
    traverse(nums)

    /* 查找元素 */
    let index = find(nums, 3)
    println("在 nums 中查找元素 3 ，得到索引 = ${index}")
}
