// File: counting_sort.go
// Created Time: 2023-03-20
// Author: Reanon (793584285@qq.com)

package chapter_sorting

type CountingSort struct{}

/* Сортировка подсчетом */
// Простая реализация, не подходит для сортировки объектов
func countingSortNaive(nums []int) {
	// 1. Найти максимальный элемент массива m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Подсчитать число появлений каждой цифры
	// counter[num] обозначает число появлений num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Обойти counter и заполнить исходный массив nums элементами
	for i, num := 0, 0; num < m+1; num++ {
		for j := 0; j < counter[num]; j++ {
			nums[i] = num
			i++
		}
	}
}

/* Сортировка подсчетом */
// Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
func countingSort(nums []int) {
	// 1. Найти максимальный элемент массива m
	m := 0
	for _, num := range nums {
		if num > m {
			m = num
		}
	}
	// 2. Подсчитать число появлений каждой цифры
	// counter[num] обозначает число появлений num
	counter := make([]int, m+1)
	for _, num := range nums {
		counter[num]++
	}
	// 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
	// То есть counter[num]-1 — это индекс последнего появления num в res
	for i := 0; i < m; i++ {
		counter[i+1] += counter[i]
	}
	// 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
	// Инициализировать массив res для хранения результата
	n := len(nums)
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		num := nums[i]
		// Поместить num по соответствующему индексу
		res[counter[num]-1] = num
		// Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
		counter[num]--
	}
	// Перезаписать исходный массив nums массивом результата res
	copy(nums, res)
}
