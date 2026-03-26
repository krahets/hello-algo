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

/* Конструктор, построитьпустойкуча */
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

/* Получить размер кучи */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* Проверить, пуста ли куча */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* Обратиться к элементу на вершине кучи */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* Добавить элемент в кучу */
func (h *maxHeap) push(val any) {
	// Добавить узел
	h.data = append(h.data, val)
	// Выполнить heapify снизу вверх
	h.siftUp(len(h.data) - 1)
}

/* Начиная с узла i, выполнить просеивание снизу вверх */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Получить родительский узел для узла i
		p := h.parent(i)
		// Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// Поменять местами два узла
		h.swap(i, p)
		// Циклически выполнять просеивание вверх
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
	// Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
	h.swap(0, h.size()-1)
	// Удалить узел
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Выполнить heapify сверху вниз
	h.siftDown(0)

	// Вернуть элемент на вершине кучи
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
		// Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
		if max == i {
			break
		}
		// Поменять местами два узла
		h.swap(i, max)
		// Циклически выполнять просеивание вниз
		i = max
	}
}

/* Вывести кучу (в виде двоичного дерева) */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
