// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
ここでは Go の Slice（スライス）を Array（配列）として扱う。こうすることで
理解の負担を減らし、データ構造とアルゴリズムに集中できる。
*/

import (
	"fmt"
	"testing"
)

/* 実行用コード */
func TestArray(t *testing.T) {
	/* 配列を初期化する */
	var arr [5]int
	fmt.Println("配列 arr =", arr)
	// Go では長さを指定したもの（[5]int）は配列、指定しないもの（[]int）はスライスになる
	// Go の配列の長さはコンパイル時に決まるため、長さの指定には定数しか使えない
	// 拡張用の extend() 関数を実装しやすくするため、以下ではスライス（Slice）を配列（Array）として扱う
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("配列 nums =", nums)

	/* ランダムアクセス */
	randomNum := randomAccess(nums)
	fmt.Println("nums からランダムに取得した要素", randomNum)

	/* 長さの拡張 */
	nums = extend(nums, 3)
	fmt.Println("配列の長さを 8 に拡張した結果 nums =", nums)

	/* 要素を挿入する */
	insert(nums, 6, 3)
	fmt.Println("インデックス 3 に数値 6 を挿入した結果 nums =", nums)

	/* 要素を削除する */
	remove(nums, 2)
	fmt.Println("インデックス 2 の要素を削除した結果 nums =", nums)

	/* 配列を走査する */
	traverse(nums)

	/* 要素を探索する */
	index := find(nums, 3)
	fmt.Println("nums から要素 3 を探索した結果のインデックス =", index)
}
