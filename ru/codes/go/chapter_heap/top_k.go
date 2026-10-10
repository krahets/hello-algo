// File: top_k.go
// Created Time: 2023-06-24
// Author: Reanon (793584285@qq.com)

package chapter_heap

import "container/heap"

type minHeap []any

func (h *minHeap) Len() int           { return len(*h) }
func (h *minHeap) Less(i, j int) bool { return (*h)[i].(int) < (*h)[j].(int) }
func (h *minHeap) Swap(i, j int)      { (*h)[i], (*h)[j] = (*h)[j], (*h)[i] }

// Метод Push интерфейса heap.Interface, реализующий добавление элемента в кучу
func (h *minHeap) Push(x any) {
	*h = append(*h, x.(int))
}

// Метод Pop интерфейса heap.Interface, реализующий извлечение элемента с вершины кучи
func (h *minHeap) Pop() any {
	// Элемент, который нужно удалить из кучи, хранится в конце
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Top: получить элемент на вершине кучи
func (h *minHeap) Top() any {
	return (*h)[0]
}

/* Найти k наибольших элементов массива с помощью кучи */
func topKHeap(nums []int, k int) *minHeap {
	// Инициализация минимальной кучи
	h := &minHeap{}
	heap.Init(h)
	// Поместить первые k элементов массива в кучу
	for i := 0; i < k; i++ {
		heap.Push(h, nums[i])
	}
	// Начиная с элемента k+1, поддерживать длину кучи равной k
	for i := k; i < len(nums); i++ {
		// Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
		if nums[i] > h.Top().(int) {
			heap.Pop(h)
			heap.Push(h, nums[i])
		}
	}
	return h
}
