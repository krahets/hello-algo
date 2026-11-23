// File: hashing_search.go
// Created Time: 2022-12-12
// Author: Slone123c (274325721@qq.com)

package chapter_searching

import . "github.com/krahets/hello-algo/pkg"

/* ハッシュ探索（配列） */
func hashingSearchArray(m map[int]int, target int) int {
	// ハッシュテーブルの key：目的の要素、value：インデックス
	// ハッシュテーブルにこの key が存在しない場合、-1 を返す
	if index, ok := m[target]; ok {
		return index
	} else {
		return -1
	}
}

/* ハッシュ探索（連結リスト） */
func hashingSearchLinkedList(m map[int]*ListNode, target int) *ListNode {
	// ハッシュテーブルの key：目的のノードの値、value：ノードオブジェクト
	// ハッシュテーブルにこの key が存在しない場合、nil を返す
	if node, ok := m[target]; ok {
		return node
	} else {
		return nil
	}
}
