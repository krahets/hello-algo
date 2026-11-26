// File: hashing_search_test.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestHashingSearch(t *testing.T) {
	target := 3
	/* Поиск по хеш-таблице в массиве */
	nums := []int{1, 5, 3, 2, 4, 7, 5, 9, 10, 8}
	// Создаём хеш-таблицу
	m := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		m[nums[i]] = i
	}
	index := hashingSearchArray(m, target)
	fmt.Println("Индекс элемента 3 = ", index)

	/* Поиск по хеш-таблице в связном списке */
	head := ArrayToLinkedList(nums)
	// Создаём хеш-таблицу
	m1 := make(map[int]*ListNode)
	for head != nil {
		m1[head.Val] = head
		head = head.Next
	}
	node := hashingSearchLinkedList(m1, target)
	fmt.Println("Узел со значением 3: ", node)
}
