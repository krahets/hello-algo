// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* バケットソート */
func bucketSort(nums []float64) {
	// k = n/2 個のバケットを初期化し、各バケットに 2 要素ずつ割り当てる想定とする
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. 配列要素を各バケットに振り分ける
	for _, num := range nums {
		// 入力データの範囲は [0, 1) であり、num * k を用いてインデックス範囲 [0, k-1] に写像する
		i := int(num * float64(k))
		// num をバケット i に追加
		buckets[i] = append(buckets[i], num)
	}
	// 2. 各バケットをソートする
	for i := 0; i < k; i++ {
		// 組み込みのスライスソート関数を使う。ほかのソートアルゴリズムに置き換えてもよい
		sort.Float64s(buckets[i])
	}
	// 3. バケットを走査して結果を結合
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
