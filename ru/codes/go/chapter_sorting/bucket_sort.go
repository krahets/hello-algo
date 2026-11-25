// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* Блочная сортировка */
func bucketSort(nums []float64) {
	// Создать k = n/2 блоков в расчёте на два элемента в каждом
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. Распределить элементы массива по блокам
	for _, num := range nums {
		// Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
		i := int(num * float64(k))
		// Добавить num в блок i
		buckets[i] = append(buckets[i], num)
	}
	// 2. Отсортировать каждый блок
	for i := 0; i < k; i++ {
		// Используем встроенную сортировку срезов. Её можно заменить другим алгоритмом
		sort.Float64s(buckets[i])
	}
	// 3. Обойти блоки и объединить результаты
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
