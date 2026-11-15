// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Driver Code */
func TestList(t *testing.T) {
	/* 初始化列表 */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("列表 nums =", nums)

	// [region]{access_element}
	/* 访问元素 */
	num := nums[1] // 访问索引 1 处的元素
	// [endregion]{access_element}
	fmt.Println("访问索引 1 处的元素，得到 num =", num)

	// [region]{update_element}
	/* 更新元素 */
	nums[1] = 0 // 将索引 1 处的元素更新为 0
	// [endregion]{update_element}
	fmt.Println("将索引 1 处的元素更新为 0 ，得到 nums =", nums)

	// [region]{clear_list}
	/* 清空列表 */
	nums = nil
	// [endregion]{clear_list}
	fmt.Println("清空列表后 nums =", nums)

	// [region]{append_element}
	/* 在尾部添加元素 */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	// [endregion]{append_element}
	fmt.Println("添加元素后 nums =", nums)

	// [region]{insert_element}
	/* 在中间插入元素 */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 在索引 3 处插入数字 6
	// [endregion]{insert_element}
	fmt.Println("在索引 3 处插入数字 6 ，得到 nums =", nums)

	// [region]{remove_element}
	/* 删除元素 */
	nums = append(nums[:3], nums[4:]...) // 删除索引 3 处的元素
	// [endregion]{remove_element}
	fmt.Println("删除索引 3 处的元素，得到 nums =", nums)

	// [region]{iterate_list}
	/* 通过索引遍历列表 */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}

	/* 直接遍历列表元素 */
	count = 0
	for _, x := range nums {
		count += x
	}
	// [endregion]{iterate_list}

	// [region]{concat_list}
	/* 拼接两个列表 */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // 将列表 nums1 拼接到 nums 之后
	// [endregion]{concat_list}
	fmt.Println("将列表 nums1 拼接到 nums 之后，得到 nums =", nums)

	// [region]{sort_list}
	/* 排序列表 */
	sort.Ints(nums) // 排序后，列表元素从小到大排列
	// [endregion]{sort_list}
	fmt.Println("排序列表后 nums =", nums)
}
