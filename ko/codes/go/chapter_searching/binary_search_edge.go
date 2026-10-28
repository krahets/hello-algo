// File: binary_search_edge.go
// Created Time: 2023-08-23
// Author: Reanon (793584285@qq.com)

package chapter_searching

/* 가장 왼쪽에 있는 target을 이진 탐색 */
func binarySearchLeftEdge(nums []int, target int) int {
	// target의 삽입 위치를 찾는 것과 같다
	i := binarySearchInsertion(nums, target)
	// target을 찾지 못했으므로 -1을 반환한다
	if i == len(nums) || nums[i] != target {
		return -1
	}
	// target을 찾았으므로 인덱스 i를 반환한다
	return i
}

/* 가장 오른쪽에 있는 target을 이진 탐색 */
func binarySearchRightEdge(nums []int, target int) int {
	// 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
	i := binarySearchInsertion(nums, target+1)
	// j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
	j := i - 1
	// target을 찾지 못했으므로 -1을 반환한다
	if j == -1 || nums[j] != target {
		return -1
	}
	// target을 찾았으므로 인덱스 j를 반환한다
	return j
}
