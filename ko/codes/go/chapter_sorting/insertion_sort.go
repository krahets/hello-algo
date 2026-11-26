// File: insertion_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* 삽입 정렬 */
func insertionSort(nums []int) {
	// 바깥 루프: 정렬된 구간은 [0, i-1]
	for i := 1; i < len(nums); i++ {
		base := nums[i]
		j := i - 1
		// 안쪽 루프: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입
		for j >= 0 && nums[j] > base {
			nums[j+1] = nums[j] // nums[j]를 오른쪽으로 한 칸 이동
			j--
		}
		nums[j+1] = base // 올바른 위치에 base 대입
	}
}
