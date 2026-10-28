// File: bubble_sort.go
// Created Time: 2022-12-06
// Author: Slone123c (274325721@qq.com)

package chapter_sorting

/* 버블 정렬 */
func bubbleSort(nums []int) {
	// 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
	for i := len(nums) - 1; i > 0; i-- {
		// 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j]와 nums[j + 1]을 교환한다
				nums[j], nums[j+1] = nums[j+1], nums[j]
			}
		}
	}
}

/* 버블 정렬(플래그 최적화)*/
func bubbleSortWithFlag(nums []int) {
	// 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
	for i := len(nums) - 1; i > 0; i-- {
		flag := false // 플래그를 초기화한다
		// 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// nums[j]와 nums[j + 1]을 교환한다
				nums[j], nums[j+1] = nums[j+1], nums[j]
				flag = true // 원소가 교환되었음을 기록한다
			}
		}
		if flag == false { // 이번 버블 과정에서 원소 교환이 없었으므로 바로 종료한다
			break
		}
	}
}
