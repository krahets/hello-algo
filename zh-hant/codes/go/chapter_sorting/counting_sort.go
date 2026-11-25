// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* 計數排序 */
// 簡易實作，無法用來將物件排序
func countingSortNaive(nums []int) {
	// 1. 找出陣列中的最大元素 m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 統計各數字出現的次數
	// counter[num] 代表 num 出現的次數
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. 走訪 counter，將各元素填入原陣列 nums
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* 計數排序 */
// 完整實作，可將物件排序，且屬於穩定排序
func countingSort(nums []int) {
	// 1. 找出陣列中的最大元素 m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. 統計各數字出現的次數
	// counter[num] 代表 num 出現的次數
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. 計算 counter 的前綴和，將「出現次數」轉為「結尾索引」
	// 也就是說，counter[num]-1 是 num 在 res 中最後一次出現的索引
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. 反向走訪 nums，將各元素填入結果陣列 res
	// 初始化陣列 res，用來記錄結果
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// 將 num 放到對應索引的位置
		res[counter[num]-1] = num
		// 將前綴和減 1，取得下次放置 num 時所需的索引
		counter[num]--
	}
	// 用結果陣列 res 覆寫原陣列 nums
	copy(nums, res)
}
