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

	// Выполнить линейный поиск в массиве
	index := linearSearchArray(nums, target)
	fmt.Println("Индекс целевого элемента 3 =", index)

	// Выполнить линейный поиск в связном списке
	head := ArrayToLinkedList(nums)
	node := linearSearchLinkedList(head, target)
	fmt.Println("Объект узла со значением 3 =", node)
}
