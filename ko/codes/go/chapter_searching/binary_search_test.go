// File: binary_search_test.go
// Created Time: 2022-12-05
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"
)

func TestBinarySearch(t *testing.T) {
	var (
		target   = 6
		nums     = []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
		expected = 2
	)
	// 배열에서 이진 탐색 수행
	actual := binarySearch(nums, target)
	fmt.Println("목표 원소 6의 인덱스 =", actual)
	if actual != expected {
		t.Errorf("목표 원소 6의 인덱스 = %d, 기댓값 = %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// 중복 원소가 있는 배열
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\n배열 nums = ", nums)

	// 이진 탐색으로 왼쪽 경계와 오른쪽 경계 찾기
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("찾을 값 =", target, "| 첫 인덱스 =", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("찾을 값 =", target, "| 마지막 인덱스 =", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// 중복 원소가 없는 배열
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("배열 nums =", nums)

	// 이진 탐색으로 삽입 위치 찾기
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("삽입할 값 =", target, "| 삽입 인덱스 =", index)
	}

	// 중복 원소가 있는 배열
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\n배열 nums =", nums)

	// 이진 탐색으로 삽입 위치 찾기
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("삽입할 값 =", target, "| 삽입 인덱스 =", index)
	}
}
