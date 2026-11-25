// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* ハッシュ探索（配列） */
func hashingSearchArray(m map[int]int, target int) int {
	// ハッシュテーブルのキーは目標の要素、値はインデックス
	// このキーがハッシュテーブルになければ -1 を返す
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* ハッシュ探索（連結リスト） */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// ハッシュテーブルのキーは目標ノードの値、値はノードオブジェクト
	// このキーがハッシュテーブルになければ nil を返す
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
