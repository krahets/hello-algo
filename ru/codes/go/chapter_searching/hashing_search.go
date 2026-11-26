// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* Поиск по хеш-таблице в массиве */
func hashingSearchArray(m map[int]int, target int) int {
	// Ключ хеш-таблицы — искомый элемент, значение — его индекс
	// Если ключа в хеш-таблице нет, возвращаем -1
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* Поиск по хеш-таблице в связном списке */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
	// Если ключа в хеш-таблице нет, возвращаем nil
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
