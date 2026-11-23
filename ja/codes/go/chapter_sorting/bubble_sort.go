// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* バブルソート */
func bubbleSort(nums []int) {
	// 外側のループ：未ソート区間は [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j] と nums[j + 1] を交換する
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* バブルソート（フラグによる最適化）*/
func bubbleSortWithFlag(nums []int) {
	// 外側のループ：未ソート区間は [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // フラグを初期化する
		// 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j] と nums[j + 1] を交換する
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // 要素を交換したことを記録する
			}
		}
		if flag == false { // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
			break
		}
	}
}
