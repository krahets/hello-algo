// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* 雜湊搜尋（陣列） */
func hashingSearchArray(m map[int]int, target int) int {
	// 雜湊表的 key 為目標元素，value 為索引
	// 若雜湊表中沒有這個 key，則回傳 -1
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* 雜湊搜尋（鏈結串列） */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// 雜湊表的 key 為目標節點的值，value 為節點物件
	// 若雜湊表中沒有這個 key，則回傳 nil
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
