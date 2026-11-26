// File: heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

// В Go макс-кучу целых чисел можно построить, реализовав heap.Interface
// Для реализации heap.Interface требуется также реализовать sort.Interface
type intHeap []any

// Метод Push интерфейса heap.Interface добавляет элемент в кучу
func (h *intHeap) Push(x any) {
	// Методы Push и Pop используют указатель в качестве получателя,
	// поскольку изменяют как содержимое среза, так и его длину.
	*h = append(*h, x.(int))
}

// Метод Pop интерфейса heap.Interface извлекает последний элемент среза (heap.Pop уже переместил туда корень)
func (h *intHeap) Pop() any {
	// Извлекаемый элемент находится в конце
	last := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return last
}

// Метод Len интерфейса sort.Interface
func (h *intHeap) Len() int {
	return len(*h)
}

// Метод Less интерфейса sort.Interface
func (h *intHeap) Less(i, j int) bool {
	// Для мин-кучи нужно использовать знак «меньше»
	return (*h)[i].(int) > (*h)[j].(int)
}

// Метод Swap интерфейса sort.Interface
func (h *intHeap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Метод Top возвращает элемент в корне
func (h *intHeap) Top() any {
	return (*h)[0]
}
