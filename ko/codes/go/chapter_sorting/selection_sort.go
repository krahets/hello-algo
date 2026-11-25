// File: selection_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 선택 정렬 */
func selectionSort(nums []int) {
	n := len(nums)
	// 바깥 루프: 미정렬 구간은 [i, n-1]
	for i := 0; i < n-1; i++ {
		// 안쪽 루프: 미정렬 구간에서 최솟값 찾기
		k := i
		for j := i + 1; j < n; j++ {
			if nums[j] < nums[k] {
				// 최솟값의 인덱스 기록
				k = j
			}
		}
		// 최솟값과 미정렬 구간의 첫 원소 교환
		nums[i], nums[k] = nums[k], nums[i]

	}
}
