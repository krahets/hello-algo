// File: binary_search.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

/* 이진 탐색(닫힌구간) */
func binarySearch(nums []int, target int) int {
	// 닫힌구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다.
	i, j := 0, len(nums)-1
	// 탐색 구간이 빌 때까지 반복한다(i > j이면 빈 구간).
	for i <= j {
		m := i + (j-i)/2      // 중점 인덱스 m을 계산한다.
		if nums[m] < target { // 이 경우 target을 찾을 구간은 [m+1, j]이다.
			i = m + 1
		} else if nums[m] > target { // 이 경우 target을 찾을 구간은 [i, m-1]이다.
			j = m - 1
		} else { // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
			return m
		}
	}
	// 목표 원소를 찾지 못했으므로 -1을 반환한다.
	return -1
}

/* 이진 탐색(왼쪽 끝만 포함하는 반열린구간) */
func binarySearchLCRO(nums []int, target int) int {
	// 왼쪽 끝만 포함하는 반열린구간 [0, n)을 초기화한다. i는 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다.
	i, j := 0, len(nums)
	// 탐색 구간이 빌 때까지 반복한다(i = j이면 빈 구간).
	for i < j {
		m := i + (j-i)/2      // 중점 인덱스 m을 계산한다.
		if nums[m] < target { // 이 경우 target을 찾을 구간은 [m+1, j)이다.
			i = m + 1
		} else if nums[m] > target { // 이 경우 target을 찾을 구간은 [i, m)이다.
			j = m
		} else { // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
			return m
		}
	}
	// 목표 원소를 찾지 못했으므로 -1을 반환한다.
	return -1
}
