// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Максимальная вместимость: жадный алгоритм */
func maxCapacity(ht []int) int {
	// Ставим i и j на противоположные концы массива
	i, j := 0, len(ht)-1
	// Изначально максимальная вместимость равна 0
	res := 0
	// Повторяем жадный выбор, пока перегородки не встретятся
	for i < j {
		// Обновляем максимальную вместимость
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// Сдвигаем указатель у более низкой перегородки к центру
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
