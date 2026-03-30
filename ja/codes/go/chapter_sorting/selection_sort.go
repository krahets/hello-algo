// File: selection_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 選択ソート */
func selectionSort(nums []int) {
	n := len(nums)
	// 外側ループ：未整列区間は [i, n-1]
	for i := 0; i < n-1; i++ {
		// 内側のループ：未ソート区間の最小要素を見つける
		k := i
		for j := i + 1; j < n; j++ {
			if nums[j] < nums[k] {
				// 最小要素のインデックスを記録
				k = j
			}
		}
		// その最小要素を未整列区間の先頭要素と交換する
		nums[i], nums[k] = nums[k], nums[i]

	}
}
