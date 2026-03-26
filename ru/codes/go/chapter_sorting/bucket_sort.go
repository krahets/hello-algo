// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* Сортировка по бакетам */
func bucketSort(nums []float64) {
	// Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. Распределить элементы массива по бакетам
	for _, num := range nums {
		// Входданныедиапазонравно [0, 1), Использовать num * k отобразить виндексдиапазон [0, k-1]
		i := int(num * float64(k))
		// Добавить num в бакет i
		buckets[i] = append(buckets[i], num)
	}
	// 2. Выполнить сортировку внутри каждого бакета
	for i := 0; i < k; i++ {
		// Использовать встроенную функцию сортировки среза; при необходимости ее можно заменить другим алгоритмом сортировки
		sort.Float64s(buckets[i])
	}
	// 3. Обойти бакеты и объединить результат
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
