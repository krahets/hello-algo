// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// Быстрая сортировка
type quickSort struct{}

// Быстрая сортировка (оптимизация медианным опорным элементом)
type quickSortMedian struct{}

// Быстрая сортировка (оптимизация глубины рекурсии)
type quickSortTailCall struct{}

/* Разбиение с опорными указателями */
func (q *quickSort) partition(nums []int, left, right int) int {
	// Взять nums[left] в качестве опорного элемента
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Идти справа налево в поисках первого элемента меньше опорного
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Идти слева направо в поисках первого элемента больше опорного
		}
		// Обмен элементов
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Переместить опорный элемент на границу двух подмассивов
	nums[i], nums[left] = nums[left], nums[i]
	return i // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// Завершить рекурсию, когда длина подмассива равна 1
	if left >= right {
		return
	}
	// Разбиение с опорными указателями
	pivot := q.partition(nums, left, right)
	// Рекурсивно обработать левый и правый подмассивы
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Выбрать медиану из трех кандидатов */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m находится между l и r
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l находится между m и r
	}
	return right
}

/* Разбиение с опорными указателями (медиана трех) */
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// Взять nums[left] в качестве опорного элемента
	med := q.medianThree(nums, left, (left+right)/2, right)
	// Переместить медиану в крайний левый элемент массива
	nums[left], nums[med] = nums[med], nums[left]
	// Взять nums[left] в качестве опорного элемента
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Идти справа налево в поисках первого элемента меньше опорного
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Идти слева направо в поисках первого элемента больше опорного
		}
		// Обмен элементов
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Переместить опорный элемент на границу двух подмассивов
	nums[i], nums[left] = nums[left], nums[i]
	return i // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// Завершить рекурсию, когда длина подмассива равна 1
	if left >= right {
		return
	}
	// Разбиение с опорными указателями
	pivot := q.partition(nums, left, right)
	// Рекурсивно обработать левый и правый подмассивы
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Разбиение с опорными указателями */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// Взять nums[left] в качестве опорного элемента
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Идти справа налево в поисках первого элемента меньше опорного
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Идти слева направо в поисках первого элемента больше опорного
		}
		// Обмен элементов
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Переместить опорный элемент на границу двух подмассивов
	nums[i], nums[left] = nums[left], nums[i]
	return i // Вернуть индекс опорного элемента
}

/* Быстрая сортировка (оптимизация глубины рекурсии) */
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// Завершить, когда длина подмассива равна 1
	for left < right {
		// Операция разбиения с опорными указателями
		pivot := q.partition(nums, left, right)
		// Выполнить быструю сортировку для более короткого из двух подмассивов
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // Рекурсивно отсортировать левый подмассив
			left = pivot + 1                 // Оставшийся неотсортированный диапазон: [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // Рекурсивно отсортировать правый подмассив
			right = pivot - 1                 // Оставшийся неотсортированный диапазон: [left, pivot - 1]
		}
	}
}
