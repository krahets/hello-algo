// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Метод Push интерфейса heap.Interface добавляет элемент в кучу
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Метод Pop интерфейса heap.Interface извлекает последний элемент среза (heap.Pop уже переместил туда корень)
func (h *minHeap) Pop() any {
	// Извлекаемый элемент находится в конце
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Метод Top возвращает элемент в корне
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* Найти k наибольших элементов массива с помощью кучи */
func topKHeap(nums []int, k int) *minHeap {
	// Инициализировать мин-кучу
	h := &minHeap{}
	heap.Init(h)
	// Добавить в кучу первые k элементов массива
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
	for i := k; i < len(nums); i++ {
		// Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
