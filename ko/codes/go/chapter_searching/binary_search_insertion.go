// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 없는 경우) */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 닫힌구간 [0, n-1]을 초기화한다.
	i, j := 0, len(nums)-1
	for i <= j {
		// 중점 인덱스 m을 계산한다.
		m := i + (j-i)/2
		if nums[m] < target {
			// target을 찾을 구간은 [m+1, j]이다.
			i = m + 1
		} else if nums[m] > target {
			// target을 찾을 구간은 [i, m-1]이다.
			j = m - 1
		} else {
			// target을 찾았으므로 삽입 위치 m을 반환한다.
			return m
		}
	}
	// target을 찾지 못했으므로 삽입 위치 i를 반환한다.
	return i
}

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 있는 경우) */
func binarySearchInsertion(nums []int, target int) int {
	// 닫힌구간 [0, n-1]을 초기화한다.
	i, j := 0, len(nums)-1
	for i <= j {
		// 중점 인덱스 m을 계산한다.
		m := i + (j-i)/2
		if nums[m] < target {
			// target을 찾을 구간은 [m+1, j]이다.
			i = m + 1
		} else if nums[m] > target {
			// target을 찾을 구간은 [i, m-1]이다.
			j = m - 1
		} else {
			// target보다 작은 원소 중 가장 오른쪽 원소를 찾을 구간은 [i, m-1]이다.
			j = m - 1
		}
	}
	// 삽입 위치 i를 반환한다.
	return i
}
