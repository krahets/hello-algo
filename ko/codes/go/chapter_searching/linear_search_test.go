// File: linear_search_test.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestLinearSearch(t *testing.T) {
	target := 3
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}

	// 배열에서 선형 탐색을 수행한다
	index := linearSearchArray(nums, target)
	fmt.Println("목표 원소 3의 인덱스 =", index)

	// 연결 리스트에서 선형 탐색을 수행한다
	head := ArrayToLinkedList(nums)
	node := linearSearchLinkedList(head, target)
	fmt.Println("목표 노드 값 3에 해당하는 노드 객체", node)
}
