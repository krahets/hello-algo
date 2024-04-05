// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* 計數排序 */
// 簡單實現，無法用於排序物件
func countingSortNaive(nums []int) {
	// 1. 統計陣列最大元素 m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 統計各數字的出現次數
	// counter[num] 代表 num 的出現次數
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. 走訪 counter ，將各元素填入原陣列 nums
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* 計數排序 */
// 完整實現，可排序物件，並且是穩定排序
func countingSort(nums []int) {
	// 1. 統計陣列最大元素 m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 統計各數字的出現次數
	// counter[num] 代表 num 的出現次數
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
	// 即 counter[num]-1 是 num 在 res 中最後一次出現的索引
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. 倒序走訪 nums ，將各元素填入結果陣列 res
	// 初始化陣列 res 用於記錄結果
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// 將 num 放置到對應索引處
		res[counter[num]-1] = num
		// 令前綴和自減 1 ，得到下次放置 num 的索引
		counter[num]--
	}
	// 使用結果陣列 res 覆蓋原陣列 nums
	copy(nums, res)
}
