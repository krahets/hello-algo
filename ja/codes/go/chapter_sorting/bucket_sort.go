// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* バケットソート */
func bucketSort(nums []float64) {
	// k = n/2 個のバケットを初期化し、各バケットに平均 2 個の要素を割り当てることを想定する
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. 配列の要素を各バケットに振り分ける
	for _, num := range nums {
		// 入力データの範囲は [0, 1) なので、num * k によりインデックス範囲 [0, k-1] に対応付ける
		i := int(num * float64(k))
		// num をバケット i に追加する
		buckets[i] = append(buckets[i], num)
	}
	// 2. 各バケットをソートする
	for i := 0; i < k; i++ {
		// 組み込みのスライスのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
		sort.Float64s(buckets[i])
	}
	// 3. バケットを走査して結果を結合する
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
