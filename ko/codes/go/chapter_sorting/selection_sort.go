// File: selection_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* 선택 정렬 */
func selectionSort(nums []int) {
	n := len(nums)
	// 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
	for i := 0; i < n-1; i++ {
		// 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
		k := i
		for j := i + 1; j < n; j++ {
			if nums[j] < nums[k] {
				// 최솟값의 인덱스를 기록한다
				k = j
			}
		}
		// 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
		nums[i], nums[k] = nums[k], nums[i]

	}
}
