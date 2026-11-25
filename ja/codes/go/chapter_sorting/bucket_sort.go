// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* バケットソート */
func bucketSort(nums []float64) {
	// k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. 配列の要素を各バケットに振り分ける
	for _, num := range nums {
		// 入力範囲は [0, 1)。num * k でインデックスの範囲 [0, k-1] に写す
		i := int(num * float64(k))
		// num をバケット i に追加
		buckets[i] = append(buckets[i], num)
	}
	// 2. 各バケットをソートする
	for i := 0; i < k; i++ {
		// 組み込みのスライス用ソート関数を使用。他のソートアルゴリズムでもよい
		sort.Float64s(buckets[i])
	}
	// 3. バケットを順に連結
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
