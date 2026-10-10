// File: bucket_sort.go
// Created Time: 2023-03-27
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "sort"

/* Сортировка корзинами */
func bucketSort(nums []float64) {
	// Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
	k := len(nums) / 2
	buckets := make([][]float64, k)
	for i := 0; i < k; i++ {
		buckets[i] = make([]float64, 0)
	}
	// 1. Распределить элементы массива по корзинам
	for _, num := range nums {
		// Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
		i := int(num * float64(k))
		// Добавить num в корзину i
		buckets[i] = append(buckets[i], num)
	}
	// 2. Выполнить сортировку внутри каждой корзины
	for i := 0; i < k; i++ {
		// Использовать встроенную функцию сортировки среза; ее также можно заменить другим алгоритмом сортировки
		sort.Float64s(buckets[i])
	}
	// 3. Обойти корзины и объединить результаты
	i := 0
	for _, bucket := range buckets {
		for _, num := range bucket {
			nums[i] = num
			i++
		}
	}
}
