// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* Хеш-поиск (массив) */
func hashingSearchArray(m map[int]int, target int) int {
	// key хеш-таблицы: целевой элемент, value: индекс
	// Если такого key нет в хеш-таблице, вернуть -1
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* Хеш-поиск (связный список) */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// key хеш-таблицы: значение целевого узла, value: объект узла
	// Если такого key нет в хеш-таблице, вернуть nil
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
