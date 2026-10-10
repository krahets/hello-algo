// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Максимальная вместимость: жадный алгоритм */
func maxCapacity(ht []int) int {
	// Инициализировать i и j так, чтобы они располагались по двум концам массива
	i, j := 0, len(ht)-1
	// Начальная максимальная вместимость равна 0
	res := 0
	// Выполнять жадный выбор в цикле, пока две доски не встретятся
	for i < j {
		// Обновить максимальную вместимость
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// Сдвигать внутрь более короткую сторону
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
