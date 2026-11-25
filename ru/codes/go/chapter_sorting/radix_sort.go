// File: radix_sort.go
// Created Time: 2023-01-18
// Author: Reanon (793584285@qq.com)

package chapter_sorting

import "math"

/* Получить k-ю цифру числа num, где exp = 10^(k-1) */
func digit(num, exp int) int {
	// Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
	return (num / exp) % 10
}

/* Сортировка подсчётом по k-й цифре элементов nums */
func countingSortDigit(nums []int, exp int) {
	// Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
	counter := make([]int, 10)
	n := len(nums)
	// Подсчитать вхождения каждой цифры от 0 до 9
	for i := 0; i < n; i++ {
		d := digit(nums[i], exp) // Получить k-ю цифру nums[i] и обозначить её d
		counter[d]++             // Подсчитать вхождения цифры d
	}
	// Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
	for i := 1; i < 10; i++ {
		counter[i] += counter[i-1]
	}
	// Пройти массив с конца и заполнить res по данным счётчиков
	res := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		d := digit(nums[i], exp)
		j := counter[d] - 1 // Найти индекс j в массиве для цифры d
		res[j] = nums[i]    // Записать текущий элемент по индексу j
		counter[d]--        // Уменьшить счётчик d на 1
	}
	// Скопировать результат в исходный массив nums
	for i := 0; i < n; i++ {
		nums[i] = res[i]
	}
}

/* Поразрядная сортировка */
func radixSort(nums []int) {
	// Найти максимум массива, чтобы определить наибольшее число разрядов
	max := math.MinInt
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	// Перебирать разряды от младшего к старшему
	for exp := 1; max >= exp; exp *= 10 {
		// Отсортировать элементы подсчётом по k-й цифре
		// k = 1 -> exp = 1
		// k = 2 -> exp = 10
		// То есть exp = 10^(k-1)
		countingSortDigit(nums, exp)
	}
}
