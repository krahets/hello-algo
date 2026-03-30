// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// Использовать срез вместо массива, чтобы не учитывать проблему расширения
	data []any
}

/* Конструктор, создающий пустую кучу */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* Конструктор, строящий кучу по срезу */
func newMaxHeap(nums []any) *maxHeap {
	// Добавить элементы списка в кучу без изменений
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// Выполнить heapify для всех узлов, кроме листовых
		h.siftDown(i)
	}
	return h
}

/* Получить индекс левого дочернего узла */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* Получить индекс правого дочернего узла */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* Получить индекс родительского узла */
func (h *maxHeap) parent(i int) int {
	// Округление вниз при делении
	return (i - 1) / 2
}

/* Поменять элементы местами */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* Получение размера кучи */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* Проверка, пуста ли куча */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* Доступ к элементу на вершине кучи */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* Добавление элемента в кучу */
func (h *maxHeap) push(val any) {
	// Добавление узла
	h.data = append(h.data, val)
	// Просеивание снизу вверх
	h.siftUp(len(h.data) - 1)
}

/* Начиная с узла i, выполнить просеивание снизу вверх */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Получение родительского узла для узла i
		p := h.parent(i)
		// Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// Поменять два узла местами
		h.swap(i, p)
		// Циклическое просеивание вверх
		i = p
	}
}

/* Извлечение элемента из кучи */
func (h *maxHeap) pop() any {
	// Обработка пустого случая
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
	h.swap(0, h.size()-1)
	// Удаление узла
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Просеивание сверху вниз
	h.siftDown(0)

	// Вернуть элемент с вершины кучи
	return val
}

/* Начиная с узла i, выполнить просеивание сверху вниз */
func (h *maxHeap) siftDown(i int) {
	for true {
		// Определить узел с максимальным значением среди i, l и r и обозначить его как max
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
		if max == i {
			break
		}
		// Поменять два узла местами
		h.swap(i, max)
		// Циклическое просеивание вниз
		i = max
	}
}

/* Вывести кучу (двоичное дерево) */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
