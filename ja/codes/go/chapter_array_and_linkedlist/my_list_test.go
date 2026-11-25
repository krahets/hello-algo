// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* ドライバコード */
func TestMyList(t *testing.T) {
	/* リストを初期化する */
	nums := newMyList()
	/* 末尾に要素を追加する */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("リスト nums = %v、容量 = %v、長さ = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* 途中に要素を挿入する */
	nums.insert(6, 3)
	fmt.Printf("インデックス 3 に 6 を挿入した後の nums = %v\n", nums.toArray())

	/* 要素を削除する */
	nums.remove(3)
	fmt.Printf("インデックス 3 の要素を削除した後の nums = %v\n", nums.toArray())

	/* 要素にアクセスする */
	num := nums.get(1)
	fmt.Printf("インデックス 1 の要素を読み出した結果 num = %v\n", num)

	/* 要素を更新する */
	nums.set(0, 1)
	fmt.Printf("インデックス 1 の要素を 0 に更新した後の nums = %v\n", nums.toArray())

	/* 容量拡張の動作を確認する */
	for i := 0; i < 10; i++ {
		// i = 5 でリストの長さが容量を超えるため、容量を拡張する
		nums.add(i)
	}
	fmt.Printf("容量拡張後のリスト nums = %v、容量 = %v、長さ = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
