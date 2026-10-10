// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
 * ここでは Go の Slice を Array 配列とみなします。これは
 * 理解コストを下げ、データ構造とアルゴリズムに集中しやすくするためです。
 */

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* 配列を初期化 */
	var arr [5]int
	fmt.Println("配列 arr =", arr)
	// Go では、長さを指定する場合（[5]int）は配列、指定しない場合（[]int）はスライスである
	// Go の配列はコンパイル時に長さが確定するよう設計されているため、長さには定数しか使えない
	// extend() 関数を実装しやすくするため、以下ではスライス（Slice）を配列（Array）として扱う
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("配列 nums =", nums)

	/* ランダムアクセス */
	randomNum := randomAccess(nums)
	fmt.Println("nums からランダムな要素を取得", randomNum)

	/* 長さを拡張 */
	nums = extend(nums, 3)
	fmt.Println("配列の長さを 8 に拡張し，nums =", nums)

	/* 要素を挿入する */
	insert(nums, 6, 3)
	fmt.Println("インデックス 3 に数値 6 を挿入し，nums =", nums)

	/* 要素を削除 */
	remove(nums, 2)
	fmt.Println("インデックス 2 の要素を削除すると、nums =", nums)

	/* 配列を走査 */
	traverse(nums)

	/* 要素を探索する */
	index := find(nums, 3)
	fmt.Println("nums 内で要素 3 を検索すると、インデックス =", index)
}
