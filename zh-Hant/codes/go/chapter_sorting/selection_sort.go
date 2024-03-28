// File: selection_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 選擇排序 */
func selectionSort(nums []int) {
	n := len(nums)
	// 外迴圈：未排序區間為 [i, n-1]
	for i := 0; i < n-1; i++ {
		// 內迴圈：找到未排序區間內的最小元素
		k := i
		for j := i + 1; j < n; j++ {
			if nums[j] < nums[k] {
				// 記錄最小元素的索引
				k = j
			}
		}
		// 將該最小元素與未排序區間的首個元素交換
		nums[i], nums[k] = nums[k], nums[i]

	}
}
