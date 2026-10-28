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
	// 배열에서 이진 탐색을 수행한다
	actual := binarySearch(nums, target)
	fmt.Println("목표 원소 6의 인덱스 =", actual)
	if actual != expected {
		t.Errorf("목표 원소 6의 인덱스 = %d, 기대값 = %d", actual, expected)
	}
}

func TestBinarySearchEdge(t *testing.T) {
	// 중복 원소를 포함하는 배열
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("\n배열 nums = ", nums)

	// 왼쪽 경계와 오른쪽 경계의 이진 탐색
	for _, target := range []int{6, 7} {
		index := binarySearchLeftEdge(nums, target)
		fmt.Println("가장 왼쪽 원소", target, "; 인덱스:", index)

		index = binarySearchRightEdge(nums, target)
		fmt.Println("가장 오른쪽 원소", target, "; 인덱스:", index)
	}
}

func TestBinarySearchInsertion(t *testing.T) {
	// 중복 원소가 없는 배열
	nums := []int{1, 3, 6, 8, 12, 15, 23, 26, 31, 35}
	fmt.Println("배열 nums =", nums)

	// 삽입 위치의 이진 탐색
	for _, target := range []int{6, 9} {
		index := binarySearchInsertionSimple(nums, target)
		fmt.Println("원소", target, "; 삽입 위치의 인덱스:", index)
	}

	// 중복 원소를 포함하는 배열
	nums = []int{1, 3, 6, 6, 6, 6, 6, 10, 12, 15}
	fmt.Println("\n배열 nums =", nums)

	// 삽입 위치의 이진 탐색
	for _, target := range []int{2, 6, 20} {
		index := binarySearchInsertion(nums, target)
		fmt.Println("원소", target, "; 삽입 위치의 인덱스:", index)
	}
}
