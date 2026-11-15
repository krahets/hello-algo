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

    // [region]{access_element}
    /* 訪問元素 */
    val num = nums[1] // 訪問索引 1 處的元素
    // [endregion]{access_element}
    println("訪問索引 1 處的元素，得到 num = $num")

    // [region]{update_element}
    /* 更新元素 */
    nums[1] = 0 // 將索引 1 處的元素更新為 0
    // [endregion]{update_element}
    println("將索引 1 處的元素更新為 0 ，得到 nums = $nums")

    // [region]{clear_list}
    /* 清空串列 */
    nums.clear()
    // [endregion]{clear_list}
    println("清空串列後 nums = $nums")

    // [region]{append_element}
    /* 在尾部新增元素 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    // [endregion]{append_element}
    println("新增元素後 nums = $nums")

    // [region]{insert_element}
    /* 在中間插入元素 */
    nums.add(3, 6) // 在索引 3 處插入數字 6
    // [endregion]{insert_element}
    println("在索引 3 處插入數字 6 ，得到 nums = $nums")

    // [region]{remove_element}
    /* 刪除元素 */
    nums.removeAt(3) // 刪除索引 3 處的元素
    // [endregion]{remove_element}
    println("刪除索引 3 處的元素，得到 nums = $nums")

    // [region]{iterate_list}
    /* 透過索引走訪串列 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 直接走訪串列元素 */
    for (j in nums) {
        count += j
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* 拼接兩個串列*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // 將串列 nums1 拼接到 nums 之後
    // [endregion]{concat_list}
    println("將串列 nums1 拼接到 nums 之後，得到 nums = $nums")

    // [region]{sort_list}
    /* 排序串列 */
    nums.sort() // 排序後，串列元素從小到大排列
    // [endregion]{sort_list}
    println("排序串列後 nums = $nums")
}