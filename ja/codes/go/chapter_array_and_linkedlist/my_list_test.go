// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestMyList(t *testing.T) {
	/* リストを初期化 */
	nums := newMyList()
	/* 末尾に要素を追加 */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("リスト nums = %v 、容量 = %v 、長さ = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* 中間に要素を挿入 */
	nums.insert(6, 3)
	fmt.Printf("インデックス 3 に数字 6 を挿入すると、nums = %v\n", nums.toArray())

	/* 要素を削除 */
	nums.remove(3)
	fmt.Printf("インデックス 3 の要素を削除すると、nums = %v\n", nums.toArray())

	/* 要素にアクセス */
	num := nums.get(1)
	fmt.Printf("インデックス 1 の要素にアクセスすると、num = %v\n", num)

	/* 要素を更新 */
	nums.set(0, 1)
	fmt.Printf("インデックス 1 の要素を 0 に更新すると、nums = %v\n", nums.toArray())

	/* 拡張機構をテストする */
	for i := 0; i < 10; i++ {
		// i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
		nums.add(i)
	}
	fmt.Printf("拡張後のリスト nums = %v 、容量 = %v 、長さ = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
