// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* 要素 num の下から k 桁目を取得（exp = 10^(k-1)） */
func digit(num, exp int) int {
	// ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
	return (num / exp) % 10
}

/* 計数ソート（nums の k 桁目でソート） */
func countingSortDigit(nums []int, exp int) {
	// 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
	counter := make([]int, 10)
	n := len(nums)
	// 0~9 の各数字の出現回数を集計する
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // nums[i] の第 k 位を取得し、d とする
		counter[d]++             // 数字 d の出現回数を数える
	}
	// 累積和を求め、「出現回数」を「配列インデックス」に変換する
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // d の配列内インデックス j を取得する
		res[j] = nums[i]    // 現在の要素をインデックス j に格納する
		counter[d]--        // d の個数を 1 減らす
	}
	// 結果で元の配列 nums を上書きする
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* 基数ソート */
func radixSort(nums []int) {
	// 最大桁数の判定用に配列の最大要素を取得
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// 下位桁から上位桁の順に走査する
	for exp := 1; max >= exp; exp *= 10 {
		// 配列要素の k 桁目に対して計数ソートを行う
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// つまり exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
