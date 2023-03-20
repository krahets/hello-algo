// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 计数排序 */
// 简单实现，无法用于排序对象
func countingSortNaive(nums []int) {
	// 1. 统计数组最大元素 m
	m := 0
	for num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 统计各数字的出现次数
	// counter[num] 代表 num 的出现次数
	counter := make([]int, m+1)
	for num := range nums {
		counter[num]++
	}
	// 3. 遍历 counter ，将各元素填入原数组 nums
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}
