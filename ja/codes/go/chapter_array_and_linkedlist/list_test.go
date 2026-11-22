// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* 実行用コード */
func TestList(t *testing.T) {
	/* リストを初期化する */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("リスト nums =", nums)

	/* 要素にアクセスする */
	num := nums[1] // インデックス 1 の要素にアクセスする
	fmt.Println("インデックス 1 の要素にアクセスした結果 num =", num)

	/* 要素を更新する */
	nums[1] = 0 // インデックス 1 の要素を 0 に更新する
	fmt.Println("インデックス 1 の要素を 0 に更新した結果 nums =", nums)

	/* リストを空にする */
	nums = nil
	fmt.Println("リストを空にした後 nums =", nums)

	/* 末尾に要素を追加する */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("要素を追加した後 nums =", nums)

	/* 途中に要素を挿入する */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // インデックス 3 に数値 6 を挿入する
	fmt.Println("インデックス 3 に数値 6 を挿入した結果 nums =", nums)

	/* 要素を削除する */
	nums = append(nums[:3], nums[4:]...) // インデックス 3 の要素を削除する
	fmt.Println("インデックス 3 の要素を削除した結果 nums =", nums)

	/* インデックスを使ってリストを走査する */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* リストの要素を直接走査する */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* 2 つのリストを連結する */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // リスト nums の後ろに nums1 を連結する
	fmt.Println("リスト nums の後ろに nums1 を連結した結果 nums =", nums)

	/* リストをソートする */
	sort.Ints(nums) // ソート後、リストの要素は昇順に並ぶ
	fmt.Println("リストをソートした後 nums =", nums)
}
