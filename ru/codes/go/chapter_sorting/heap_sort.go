// File: heap_sort.go
// Created Time: 2023-05-29
// Author: Reanon (793584285@qq.com)

package chapter_sorting

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
func siftDown(nums *[]int, n, i int) {
	for true {
		// Найти среди i, l, r узел с наибольшим значением и обозначить его ma
		l := 2*i + 1
		r := 2*i + 2
		ma := i
		if l < n && (*nums)[l] > (*nums)[ma] {
			ma = l
		}
		if r < n && (*nums)[r] > (*nums)[ma] {
			ma = r
		}
		// Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
		if ma == i {
			break
		}
		// Поменять два узла местами
		(*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
		// Продолжить просеивание вниз
		i = ma
	}
}

/* Пирамидальная сортировка */
func heapSort(nums *[]int) {
	// Построить кучу: выполнить просеивание для всех узлов, кроме листьев
	for i := len(*nums)/2 - 1; i >= 0; i-- {
		siftDown(nums, len(*nums), i)
	}
	// Извлечь максимум из кучи n-1 раз
	for i := len(*nums) - 1; i > 0; i-- {
		// Обменять корень с крайним правым листом (первый элемент с последним)
		(*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
		// Выполнить просеивание вниз от корня
		siftDown(nums, i, 0)
	}
}
