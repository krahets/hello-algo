// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
ここでは Go のスライス（Slice）を配列（Array）として扱う。こうすると、
理解が容易になり、データ構造とアルゴリズムに集中できる。
*/

import (
	"fmt"
	"testing"
)

/* ドライバコード */
func TestArray(t *testing.T) {
	/* 配列を初期化する */
	var arr [5]int
	fmt.Println("配列 arr =", arr)
	// Go では長さを指定すると配列（[5]int）、指定しないとスライス（[]int）になる
	// Go の配列はコンパイル時に長さが決まる設計なので、長さは定数で指定する
	// 容量を拡張する関数 extend() を実装しやすくするため、以下ではスライス（Slice）を配列（Array）として扱う
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("配列 nums =", nums)

	/* ランダムアクセス */
	randomNum := randomAccess(nums)
	fmt.Println("nums からランダムに選んだ要素：", randomNum)

	/* 配列の長さを増やす */
	nums = extend(nums, 3)
	fmt.Println("配列の長さを 8 に増やした後の nums =", nums)

	/* 要素を挿入する */
	insert(nums, 6, 3)
	fmt.Println("インデックス 3 に 6 を挿入した後の nums =", nums)

	/* 要素を削除する */
	remove(nums, 2)
	fmt.Println("インデックス 2 の要素を削除した後の nums =", nums)

	/* 配列を走査する */
	traverse(nums)

	/* 要素を探す */
	index := find(nums, 3)
	fmt.Println("nums で要素 3 が見つかったインデックス =", index)
}
