// File: binary_search_insertion.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 삽입 위치의 이진 탐색(중복 원소 없음) */
func binarySearchInsertionSimple(nums []int, target int) int {
	// 닫힌 구간 [0, n-1]을 초기화한다
	i, j := 0, len(nums)-1
	for i <= j {
		// 중간 인덱스 m을 계산한다
		m := i + (j-i)/2
		if nums[m] < target {
			// target은 구간 [m+1, j]에 있다
			i = m + 1
		} else if nums[m] > target {
			// target은 구간 [i, m-1]에 있다
			j = m - 1
		} else {
			// target을 찾았으므로 삽입 위치 m을 반환한다
			return m
		}
	}
	// target을 찾지 못했으므로 삽입 위치 i를 반환한다
	return i
}

/* 삽입 위치의 이진 탐색(중복 원소 있음) */
func binarySearchInsertion(nums []int, target int) int {
	// 닫힌 구간 [0, n-1]을 초기화한다
	i, j := 0, len(nums)-1
	for i <= j {
		// 중간 인덱스 m을 계산한다
		m := i + (j-i)/2
		if nums[m] < target {
			// target은 구간 [m+1, j]에 있다
			i = m + 1
		} else if nums[m] > target {
			// target은 구간 [i, m-1]에 있다
			j = m - 1
		} else {
			// target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
			j = m - 1
		}
	}
	// 삽입 위치 i를 반환한다
	return i
}
