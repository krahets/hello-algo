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
	/* 初始化串列 */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("串列 nums =", nums)

	// [region]{access_element}
	/* 訪問元素 */
	num := nums[1] // 訪問索引 1 處的元素
	// [endregion]{access_element}
	fmt.Println("訪問索引 1 處的元素，得到 num =", num)

	// [region]{update_element}
	/* 更新元素 */
	nums[1] = 0 // 將索引 1 處的元素更新為 0
	// [endregion]{update_element}
	fmt.Println("將索引 1 處的元素更新為 0 ，得到 nums =", nums)

	// [region]{clear_list}
	/* 清空串列 */
	nums = nil
	// [endregion]{clear_list}
	fmt.Println("清空串列後 nums =", nums)

	// [region]{append_element}
	/* 在尾部新增元素 */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	// [endregion]{append_element}
	fmt.Println("新增元素後 nums =", nums)

	// [region]{insert_element}
	/* 在中間插入元素 */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 在索引 3 處插入數字 6
	// [endregion]{insert_element}
	fmt.Println("在索引 3 處插入數字 6 ，得到 nums =", nums)

	// [region]{remove_element}
	/* 刪除元素 */
	nums = append(nums[:3], nums[4:]...) // 刪除索引 3 處的元素
	// [endregion]{remove_element}
	fmt.Println("刪除索引 3 處的元素，得到 nums =", nums)

	// [region]{iterate_list}
	/* 透過索引走訪串列 */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}

	/* 直接走訪串列元素 */
	count = 0
	for _, x := range nums {
		count += x
	}
	// [endregion]{iterate_list}

	// [region]{concat_list}
	/* 拼接兩個串列 */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // 將串列 nums1 拼接到 nums 之後
	// [endregion]{concat_list}
	fmt.Println("將串列 nums1 拼接到 nums 之後，得到 nums =", nums)

	// [region]{sort_list}
	/* 排序串列 */
	sort.Ints(nums) // 排序後，串列元素從小到大排列
	// [endregion]{sort_list}
	fmt.Println("排序串列後 nums =", nums)
}
