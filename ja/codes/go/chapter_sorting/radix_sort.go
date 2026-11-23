// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* 要素 num の第 k 桁を取得する。exp = 10^(k-1) とする */
func digit(num, exp int) int {
	// k ではなく exp を渡すことで、ここで高コストのべき乗計算を繰り返すのを避ける
	return (num / exp) % 10
}

/* カウントソート（nums の第 k 桁に基づくソート） */
func countingSortDigit(nums []int, exp int) {
	// 十進数の各桁の範囲は 0~9 なので、長さ 10 のバケット配列が必要
	counter := make([]int, 10)
	n := len(nums)
	// 0~9 の各数字の出現回数を数える
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // nums[i] の第 k 桁を取得し、d とする
		counter[d]++             // 数字 d の出現回数を数える
	}
	// 累積和を求め、「出現回数」を「配列のインデックス」に変換する
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// 逆順に走査し、バケット内の集計結果に基づいて各要素を res に入れる
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // 配列内での d のインデックス j を取得する
		res[j] = nums[i]    // 現在の要素をインデックス j に入れる
		counter[d]--        // d の個数を 1 減らす
	}
	// 結果で元の配列 nums を上書きする
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* 基数ソート */
func radixSort(nums []int) {
	// 最大桁数を判定するため、配列の最大要素を取得する
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// 下位の桁から上位の桁へ順に走査する
	for exp := 1; max >= exp; exp *= 10 {
		// 配列の要素の第 k 桁に対してカウントソートを行う
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// つまり exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
