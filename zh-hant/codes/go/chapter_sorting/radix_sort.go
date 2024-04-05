// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* 獲取元素 num 的第 k 位，其中 exp = 10^(k-1) */
func digit(num, exp int) int {
	// 傳入 exp 而非 k 可以避免在此重複執行昂貴的次方計算
	return (num / exp) % 10
}

/* 計數排序（根據 nums 第 k 位排序） */
func countingSortDigit(nums []int, exp int) {
	// 十進位制的位範圍為 0~9 ，因此需要長度為 10 的桶陣列
	counter := make([]int, 10)
	n := len(nums)
	// 統計 0~9 各數字的出現次數
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // 獲取 nums[i] 第 k 位，記為 d
		counter[d]++             // 統計數字 d 的出現次數
	}
	// 求前綴和，將“出現個數”轉換為“陣列索引”
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// 倒序走訪，根據桶內統計結果，將各元素填入 res
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // 獲取 d 在陣列中的索引 j
		res[j] = nums[i]    // 將當前元素填入索引 j
		counter[d]--        // 將 d 的數量減 1
	}
	// 使用結果覆蓋原陣列 nums
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* 基數排序 */
func radixSort(nums []int) {
	// 獲取陣列的最大元素，用於判斷最大位數
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// 按照從低位到高位的順序走訪
	for exp := 1; max >= exp; exp *= 10 {
		// 對陣列元素的第 k 位執行計數排序
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// 即 exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
