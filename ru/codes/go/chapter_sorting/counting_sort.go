// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
func countingSortNaive(nums []int) {
	// 1. Найти максимальный элемент m в массиве
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Подсчитать число вхождений каждого значения
	// counter[num] — число вхождений num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Пройти по counter и записать элементы в исходный массив nums
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
func countingSort(nums []int) {
	// 1. Найти максимальный элемент m в массиве
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Подсчитать число вхождений каждого значения
	// counter[num] — число вхождений num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
	// То есть counter[num]-1 — индекс последнего вхождения num в res
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
	// Создать массив res для результата
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// Поместить num по соответствующему индексу
		res[counter[num]-1] = num
		// Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
		counter[num]--
	}
	// Скопировать результат из res в исходный массив nums
	copy(nums, res)
}
