// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* 桶排序 */
func bucketSort(nums []float64) {
	// 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. 將陣列元素分配到各個桶中
	for _, num := range nums {
		// 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
		i := int(num * float64(k))
		// 將 num 新增進桶 i
		buckets[i] = append(buckets[i], num)
	}
	// 2. 對各個桶執行排序
	for i := 0; i < k; i++ {
		// 使用內建切片排序函式，也可以替換成其他排序演算法
		sort.Float64s(buckets[i])
	}
	// 3. 走訪桶合併結果
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
