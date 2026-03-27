// File: merge_sort.go
// Created Time: 2022-12-13
// Author: msk397 (machangxinq@gmail.com)

package chapter_sorting

/* Объединить левый и правый подмассивы */
func merge(nums []int, left, mid, right int) {
	// Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
	// Создать временный массив tmp для хранения результата слияния
	tmp := make([]int, right-left+1)
	// Инициализировать начальные индексы левого и правого подмассивов
	i, j, k := left, mid+1, 0
	// Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
	for i <= mid && j <= right {
		if nums[i] <= nums[j] {
			tmp[k] = nums[i]
			i++
		} else {
			tmp[k] = nums[j]
			j++
		}
		k++
	}
	// Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
	for i <= mid {
		tmp[k] = nums[i]
		i++
		k++
	}
	for j <= right {
		tmp[k] = nums[j]
		j++
		k++
	}
	// Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
	for k := 0; k < len(tmp); k++ {
		nums[left+k] = tmp[k]
	}
}

/* Сортировка слиянием */
func mergeSort(nums []int, left, right int) {
	// Условие завершения
	if left >= right {
		return
	}
	// Этап разбиения
	mid := left + (right - left) / 2
	mergeSort(nums, left, mid)
	mergeSort(nums, mid+1, right)
	// Этап слияния
	merge(nums, left, mid, right)
}
