// File: fractional_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "sort"

/* Предмет */
type Item struct {
	w int // Вес предмета
	v int // Стоимость предмета
}

/* Дробный рюкзак: жадный алгоритм */
func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
	// Создаём список предметов с двумя свойствами: весом и стоимостью
	items := make([]Item, len(wgt))
	for i := 0; i < len(wgt); i++ {
		items[i] = Item{wgt[i], val[i]}
	}
	// Сортируем по убыванию удельной стоимости item.v / item.w
	sort.Slice(items, func(i, j int) bool {
		return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
	})
	// На каждом шаге делаем жадный выбор
	res := 0.0
	for _, item := range items {
		if item.w <= cap {
			// Если места достаточно, кладём предмет целиком
			res += float64(item.v)
			cap -= item.w
		} else {
			// Если места недостаточно, кладём часть предмета
			res += float64(item.v) / float64(item.w) * float64(cap)
			// Рюкзак заполнен, выходим из цикла
			break
		}
	}
	return res
}
