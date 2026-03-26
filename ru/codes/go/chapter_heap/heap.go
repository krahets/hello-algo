// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// В Go целочисленную max-кучу можно построить, реализовав heap.Interface
// Для реализации heap.Interface также нужно реализовать sort.Interface
type intHeap []any

// Функция Push интерфейса heap.Interface, реализующая добавление элемента в кучу
func (h *intHeap) Push(x any) {
	// Push и Pop используют pointer receiver
	// Потому что они не только изменяют содержимое среза, но и меняют его длину.
	*h = append(*h, x.(int))
}

// Функция Pop интерфейса heap.Interface, реализующая извлечение верхнего элемента кучи
func (h *intHeap) Pop() any {
	// Элемент, подлежащий извлечению из кучи, хранится в конце
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Функция Len интерфейса sort.Interface
func (h *intHeap) Len() int {
	return len(*h)
}

// Функция Less интерфейса sort.Interface
func (h *intHeap) Less(i, j int) bool {
	// Если реализуется min-куча, знак сравнения нужно заменить на «меньше»
	return (*h)[i].(int) > (*h)[j].(int)
}

// Функция Swap интерфейса sort.Interface
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top Получить верхний элемент кучи
func (h *intHeap) Top() any {
	return (*h)[0]
}
