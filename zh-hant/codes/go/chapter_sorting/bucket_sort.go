// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* 桶排序 */
func bucketSort(nums []float64) {
	// 初始化 k = n/2 個桶，預期每個桶會分到 2 個元素
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. 將陣列元素分配到各個桶中
	for _, num := range nums {
		// 輸入資料的範圍為 [0, 1)，以 num * k 對應到索引範圍 [0, k-1]
		i := int(num * float64(k))
		// 將 num 加入編號為 i 的桶
		buckets[i] = append(buckets[i], num)
	}
	// 2. 分別將每個桶內的元素排序
	for i := 0; i < k; i++ {
		// 使用內建的切片排序函式，也可以改用其他排序演算法
		sort.Float64s(buckets[i])
	}
	// 3. 依序走訪各桶並合併結果
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
