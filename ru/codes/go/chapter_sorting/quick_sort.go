// File: quick_sort.go
// Created Time: 2022-12-12
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

// Быстрая сортировка
type quickSort struct{}

// Быстрая сортировка с выбором медианы в качестве опорного элемента
type quickSortMedian struct{}

// Быстрая сортировка с уменьшенной глубиной рекурсии
type quickSortTailCall struct{}

/* Разбиение двумя указателями */
func (q *quickSort) partition(nums []int, left, right int) int {
	// Выбрать nums[left] опорным элементом
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Справа налево найти первый элемент меньше опорного
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Слева направо найти первый элемент больше опорного
		}
		// Обмен элементов
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Обменом поместить опорный элемент на границу подмассивов
	nums[i], nums[left] = nums[left], nums[i]
	return i // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
func (q *quickSort) quickSort(nums []int, left, right int) {
	// Завершить рекурсию при длине подмассива 1
	if left >= right {
		return
	}
	// Разбиение двумя указателями
	pivot := q.partition(nums, left, right)
	// Рекурсивно отсортировать левый и правый подмассивы
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Выбрать медиану трёх кандидатов */
func (q *quickSortMedian) medianThree(nums []int, left, mid, right int) int {
	l, m, r := nums[left], nums[mid], nums[right]
	if (l <= m && m <= r) || (r <= m && m <= l) {
		return mid // m лежит между l и r
	}
	if (m <= l && l <= r) || (r <= l && l <= m) {
		return left // l лежит между m и r
	}
	return right
}

/* Разбиение двумя указателями с выбором медианы трёх*/
func (q *quickSortMedian) partition(nums []int, left, right int) int {
	// Выбрать nums[left] опорным элементом
	med := q.medianThree(nums, left, (left+right)/2, right)
	// Обменом поместить медиану в начало массива
	nums[left], nums[med] = nums[med], nums[left]
	// Выбрать nums[left] опорным элементом
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- //Справа налево найти первый элемент меньше опорного
		}
		for i < j && nums[i] <= nums[left] {
			i++ //Слева направо найти первый элемент больше опорного
		}
		//Обмен элементов
		nums[i], nums[j] = nums[j], nums[i]
	}
	//Обменом поместить опорный элемент на границу подмассивов
	nums[i], nums[left] = nums[left], nums[i]
	return i //Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
func (q *quickSortMedian) quickSort(nums []int, left, right int) {
	// Завершить рекурсию при длине подмассива 1
	if left >= right {
		return
	}
	// Разбиение двумя указателями
	pivot := q.partition(nums, left, right)
	// Рекурсивно отсортировать левый и правый подмассивы
	q.quickSort(nums, left, pivot-1)
	q.quickSort(nums, pivot+1, right)
}

/* Разбиение двумя указателями */
func (q *quickSortTailCall) partition(nums []int, left, right int) int {
	// Выбрать nums[left] опорным элементом
	i, j := left, right
	for i < j {
		for i < j && nums[j] >= nums[left] {
			j-- // Справа налево найти первый элемент меньше опорного
		}
		for i < j && nums[i] <= nums[left] {
			i++ // Слева направо найти первый элемент больше опорного
		}
		// Обмен элементов
		nums[i], nums[j] = nums[j], nums[i]
	}
	// Обменом поместить опорный элемент на границу подмассивов
	nums[i], nums[left] = nums[left], nums[i]
	return i // Вернуть индекс опорного элемента
}

/* Быстрая сортировка с уменьшенной глубиной рекурсии*/
func (q *quickSortTailCall) quickSort(nums []int, left, right int) {
	// Завершить обработку при длине подмассива 1
	for left < right {
		// Выполнить разбиение двумя указателями
		pivot := q.partition(nums, left, right)
		// Применить быструю сортировку к более короткому подмассиву
		if pivot-left < right-pivot {
			q.quickSort(nums, left, pivot-1) // Рекурсивно отсортировать левый подмассив
			left = pivot + 1                 // Оставшийся неотсортированный участок: [pivot + 1, right]
		} else {
			q.quickSort(nums, pivot+1, right) // Рекурсивно отсортировать правый подмассив
			right = pivot - 1                 // Оставшийся неотсортированный участок: [left, pivot - 1]
		}
	}
}
