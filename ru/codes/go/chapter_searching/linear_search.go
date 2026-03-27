// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Линейный поиск (массив) */
func linearSearchArray(nums []int, target int) int {
	// Обход массива
	for i := 0; i < len(nums); i++ {
		// Целевой элемент найден, вернуть его индекс
		if nums[i] == target {
			return i
		}
	}
	// Целевой элемент не найден, вернуть -1
	return -1
}

/* Линейный поиск (связный список) */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// Обойти связный список
	for node != nil {
		// Найти целевой узел и вернуть его
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// Целевой элемент не найден, вернуть nil
	return nil
}
