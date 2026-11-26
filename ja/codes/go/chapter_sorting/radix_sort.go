// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
func digit(num, exp int) int {
	// k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
	return (num / exp) % 10
}

/* カウントソート（nums の下から k 桁目でソート） */
func countingSortDigit(nums []int, exp int) {
	// 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
	counter := make([]int, 10)
	n := len(nums)
	// 0～9 の各数字の出現回数を数える
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // nums[i] の下から k 桁目を d とする
		counter[d]++             // 数字 d の出現回数を数える
	}
	// 累積和を求め、出現回数を配列のインデックスに対応する値に変換
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // 配列内での d のインデックス j を求める
		res[j] = nums[i]    // 現在の要素をインデックス j に書き込む
		counter[d]--        // d の個数を 1 減らす
	}
	// 結果で元の配列 nums を上書き
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* 基数ソート */
func radixSort(nums []int) {
	// 配列の最大値から最大桁数を求める
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// 下位桁から上位桁へ順に走査
	for exp := 1; max >= exp; exp *= 10 {
		// 配列要素の下から k 桁目にカウントソートを適用
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// すなわち exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
