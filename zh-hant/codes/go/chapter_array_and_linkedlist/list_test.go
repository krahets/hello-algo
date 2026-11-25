// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* 範例主程式 */
func TestList(t *testing.T) {
	/* 初始化列表 */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("列表 nums =", nums)

	/* 存取元素 */
	num := nums[1] // 存取索引 1 處的元素
	fmt.Println("存取索引 1 處的元素，得到 num =", num)

	/* 更新元素 */
	nums[1] = 0 // 將索引 1 處的元素更新為 0
	fmt.Println("將索引 1 處的元素更新為 0，得到 nums =", nums)

	/* 清空列表 */
	nums = nil
	fmt.Println("清空列表後，nums =", nums)

	/* 在尾端加入元素 */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("加入元素後，nums =", nums)

	/* 在中間插入元素 */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 在索引 3 處插入數字 6
	fmt.Println("在索引 3 處插入數字 6，得到 nums =", nums)

	/* 刪除元素 */
	nums = append(nums[:3], nums[4:]...) // 刪除索引 3 處的元素
	fmt.Println("刪除索引 3 處的元素，得到 nums =", nums)

	/* 依索引走訪列表 */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* 直接走訪列表中的元素 */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* 串接兩個列表 */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // 將列表 nums1 接在 nums 之後
	fmt.Println("將列表 nums1 接在 nums 之後，得到 nums =", nums)

	/* 排序列表 */
	sort.Ints(nums) // 排序後，列表元素由小到大排列
	fmt.Println("列表排序後，nums =", nums)
}
