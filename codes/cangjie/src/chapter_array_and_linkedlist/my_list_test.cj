/**
 * File: my_list_test.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.chapter_array_and_linkedlist

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testMyListTest() {
    /* 初始化列表 */
    let nums: MyList = MyList()
    /* 在尾部添加元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("列表 nums = ${nums.toArray()} ，容量 = ${nums.capacity}, 长度 = ${nums.size}")

    /* 在中间插入元素 */
    nums.insert(3, 6)
    println("在索引 3 处插入数字 6 ，得到 nums = ${nums.toArray()}")

    /* 删除元素 */
    nums.remove(3)
    println("删除索引 3 处的元素，得到 nums = ${nums.toArray()}")

    /* 访问元素 */
    let num = nums.get(1)
    println("访问索引 1 处的元素，得到 num = ${num}")

    /* 更新元素 */
    nums.set(1, 0)
    println("将索引 1 处的元素更新为 0 ，得到 nums = ${nums.toArray()}")

    /* 测试扩容机制 */
    for (i in 0..10) {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums.add(i)
    }
    println("扩容后的列表 nums = ${nums.toArray()}, 容量 = ${nums.capacity}, 长度 = ${nums.size}")
}
