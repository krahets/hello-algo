// File: binary_search_recur.go
// Created Time: 2023-07-19
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

/* 이진 탐색: 문제 f(i, j) */
func dfs(nums []int, target, i, j int) int {
	// 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
	if i > j {
		return -1
	}
	//	중간 인덱스를 계산한다
	m := i + ((j - i) >> 1)
	//중간 원소와 목표 원소의 크기를 비교한다
	if nums[m] < target {
		// 중간 원소가 더 작으면 배열의 오른쪽 절반을 재귀적으로 탐색한다
		// 부분 문제 f(m+1, j)를 재귀적으로 푼다
		return dfs(nums, target, m+1, j)
	} else if nums[m] > target {
		// 중간 원소가 더 크면 배열의 왼쪽 절반을 재귀적으로 탐색한다
		// 부분 문제 f(i, m-1)를 재귀적으로 푼다
		return dfs(nums, target, i, m-1)
	} else {
		// 목표 원소를 찾았으므로 해당 인덱스를 반환한다
		return m
	}
}

/* 이진 탐색 */
func binarySearch(nums []int, target int) int {
	n := len(nums)
	return dfs(nums, target, 0, n-1)
}
