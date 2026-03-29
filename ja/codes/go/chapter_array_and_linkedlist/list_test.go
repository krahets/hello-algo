// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Driver Code */
func TestList(t *testing.T) {
	/* リストを初期化 */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("リスト nums =", nums)

	/* 要素にアクセス */
	num := nums[1] // インデックス 1 の要素にアクセス
	fmt.Println("インデックス 1 の要素にアクセスすると、num =", num)

	/* 要素を更新 */
	nums[1] = 0 // 添字 1 の要素を 0 に更新
	fmt.Println("インデックス 1 の要素を 0 に更新すると、nums =", nums)

	/* リストを空にする */
	nums = nil
	fmt.Println("リストを空にした後の nums =", nums)

	/* 末尾に要素を追加 */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("要素追加後の nums =", nums)

	/* 中間に要素を挿入 */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 添字 3 に数字 6 を挿入
	fmt.Println("インデックス 3 に数値 6 を挿入し，nums =", nums)

	/* 要素を削除 */
	nums = append(nums[:3], nums[4:]...) // インデックス 3 の要素を削除する
	fmt.Println("インデックス 3 の要素を削除すると、nums =", nums)

	/* インデックスでリストを走査 */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* リスト要素を直接走査 */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* 2 つのリストを連結する */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // リスト nums1 を nums の後ろに連結
	fmt.Println("リスト nums1 を nums の後ろに連結すると、nums =", nums)

	/* リストをソート */
	sort.Ints(nums) // ソート後、リスト要素は小さい順に並ぶ
	fmt.Println("リストをソートすると、nums =", nums)
}
