// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
func digit(num, exp int) int {
	// 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
	return (num / exp) % 10
}

/* 计数排序（根据 nums 第 k 位排序） */
func countingSortDigit(nums []int, exp int) {
	// 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
	counter := make([]int, 10)
	n := len(nums)
	// 统计 0~9 各数字的出现次数
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // 获取 nums[i] 第 k 位，记为 d
		counter[d]++             // 统计数字 d 的出现次数
	}
	// 求前缀和，将“出现个数”转换为“数组索引”
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// 倒序遍历，根据桶内统计结果，将各元素填入 res
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // 获取 d 在数组中的索引 j
		res[j] = nums[i]    // 将当前元素填入索引 j
		counter[d]--        // 将 d 的数量减 1
	}
	// 使用结果覆盖原数组 nums
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* 基数排序 */
func radixSort(nums []int) {
	// 获取数组的最大元素，用于判断最大位数
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// 按照从低位到高位的顺序遍历
	for exp := 1; max >= exp; exp *= 10 {
		// 对数组元素的第 k 位执行计数排序
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// 即 exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
