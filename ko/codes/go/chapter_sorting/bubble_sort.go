// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* 버블 정렬 */
func bubbleSort(nums []int) {
	// 바깥 루프: 미정렬 구간은 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j]와 nums[j + 1] 교환
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* 플래그로 최적화한 버블 정렬*/
func bubbleSortWithFlag(nums []int) {
	// 바깥 루프: 미정렬 구간은 [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // 플래그 초기화
		// 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j]와 nums[j + 1] 교환
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // 원소가 교환되었음을 기록
			}
		}
		if flag == false { // 이 회전에서 교환이 한 번도 없으면 바로 종료
			break
		}
	}
}
