// File: time_complexity.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_computational_complexity

/* Постоянная сложность */
func constant(n int) int {
	count := 0
	size := 100000
	for i := 0; i < size; i++ {
		count++
	}
	return count
}

/* Линейная сложность */
func linear(n int) int {
	count := 0
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* Линейная сложность (обход массива) */
func arrayTraversal(nums []int) int {
	count := 0
	// Число итераций пропорционально длине массива
	for range nums {
		count++
	}
	return count
}

/* Квадратичная сложность */
func quadratic(n int) int {
	count := 0
	// Число итераций квадратично зависит от размера данных n
	for i := 0; i < n; i++ {
		for j := 0; j < n; j++ {
			count++
		}
	}
	return count
}

/* Квадратичная сложность (пузырьковая сортировка) */
func bubbleSort(nums []int) int {
	count := 0 // Счетчик
	// Внешний цикл: неотсортированный диапазон [0, i]
	for i := len(nums) - 1; i > 0; i-- {
		// Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
		for j := 0; j < i; j++ {
			if nums[j] > nums[j+1] {
				// Поменять местами nums[j] и nums[j + 1]
				tmp := nums[j]
				nums[j] = nums[j+1]
				nums[j+1] = tmp
				count += 3 // Обмен элементов включает 3 элементарные операции
			}
		}
	}
	return count
}

/* Экспоненциальная сложность (итеративная реализация) */
func exponential(n int) int {
	count, base := 0, 1
	// На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
	for i := 0; i < n; i++ {
		for j := 0; j < base; j++ {
			count++
		}
		base *= 2
	}
	// count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
	return count
}

/* Экспоненциальная сложность (рекурсивная реализация) */
func expRecur(n int) int {
	if n == 1 {
		return 1
	}
	return expRecur(n-1) + expRecur(n-1) + 1
}

/* Логарифмическая сложность (итеративная реализация) */
func logarithmic(n int) int {
	count := 0
	for n > 1 {
		n = n / 2
		count++
	}
	return count
}

/* Логарифмическая сложность (рекурсивная реализация) */
func logRecur(n int) int {
	if n <= 1 {
		return 0
	}
	return logRecur(n/2) + 1
}

/* Линейно-логарифмическая сложность */
func linearLogRecur(n int) int {
	if n <= 1 {
		return 1
	}
	count := linearLogRecur(n/2) + linearLogRecur(n/2)
	for i := 0; i < n; i++ {
		count++
	}
	return count
}

/* Факториальная сложность (рекурсивная реализация) */
func factorialRecur(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	// Из одного получается n
	for i := 0; i < n; i++ {
		count += factorialRecur(n - 1)
	}
	return count
}
