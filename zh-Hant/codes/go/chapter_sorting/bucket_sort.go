// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* 桶排序 */
func bucketSort(nums []float64) {
	// 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. 将数组元素分配到各个桶中
	for _, num := range nums {
		// 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
		i := int(num * float64(k))
		// 将 num 添加进桶 i
		buckets[i] = append(buckets[i], num)
	}
	// 2. 对各个桶执行排序
	for i := 0; i < k; i++ {
		// 使用内置切片排序函数，也可以替换成其他排序算法
		sort.Float64s(buckets[i])
	}
	// 3. 遍历桶合并结果
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
