// File: linear_search.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package chapter_searching

import (
	. "github.com/krahets/hello-algo/pkg"
)

/* Линейный поиск в массиве */
func linearSearchArray(nums []int, target int) int {
	// Обходим массив
	for i := 0; i < len(nums); i++ {
		// Элемент найден, возвращаем его индекс
		if nums[i] == target {
			return i
		}
	}
	// Элемент не найден, возвращаем -1
	return -1
}

/* Линейный поиск в связном списке */
func linearSearchLinkedList(node *ListNode, target int) *ListNode {
	// Обходим связный список
	for node != nil {
		// Нужный узел найден, возвращаем его
		if node.Val == target {
			return node
		}
		node = node.Next
	}
	// Искомый элемент не найден, возвращаем nil
	return nil
}
