// File: my_heap.go
// Created Time: 2023-01-12
// Author: Reanon (793584285@qq.com)

package chapter_heap

import (
	"fmt"

	. "github.com/krahets/hello-algo/pkg"
)

type maxHeap struct {
	// Срез, в отличие от массива, расширяется автоматически
	data []any
}

/* Конструктор пустой кучи */
func newHeap() *maxHeap {
	return &maxHeap{
		data: make([]any, 0),
	}
}

/* Конструктор кучи по срезу */
func newMaxHeap(nums []any) *maxHeap {
	// Поместить элементы списка в кучу в прежнем порядке
	h := &maxHeap{data: nums}
	for i := h.parent(len(h.data) - 1); i >= 0; i-- {
		// Выполнить просеивание для всех узлов, кроме листьев
		h.siftDown(i)
	}
	return h
}

/* Индекс левого ребёнка */
func (h *maxHeap) left(i int) int {
	return 2*i + 1
}

/* Индекс правого ребёнка */
func (h *maxHeap) right(i int) int {
	return 2*i + 2
}

/* Индекс родителя */
func (h *maxHeap) parent(i int) int {
	// Целочисленное деление с округлением вниз
	return (i - 1) / 2
}

/* Поменять элементы местами */
func (h *maxHeap) swap(i, j int) {
	h.data[i], h.data[j] = h.data[j], h.data[i]
}

/* Размер кучи */
func (h *maxHeap) size() int {
	return len(h.data)
}

/* Проверить, пуста ли куча */
func (h *maxHeap) isEmpty() bool {
	return len(h.data) == 0
}

/* Посмотреть элемент в корне */
func (h *maxHeap) peek() any {
	return h.data[0]
}

/* Вставить элемент в кучу */
func (h *maxHeap) push(val any) {
	// Добавить узел
	h.data = append(h.data, val)
	// Просеивание вверх
	h.siftUp(len(h.data) - 1)
}

/* Просеивать вверх от узла i */
func (h *maxHeap) siftUp(i int) {
	for true {
		// Найти родителя узла i
		p := h.parent(i)
		// Если вышли за корень или узел уже на своём месте, завершить просеивание
		if p < 0 || h.data[i].(int) <= h.data[p].(int) {
			break
		}
		// Поменять два узла местами
		h.swap(i, p)
		// Продолжить просеивание вверх
		i = p
	}
}

/* Извлечь элемент из кучи */
func (h *maxHeap) pop() any {
	// Проверить, пуста ли куча
	if h.isEmpty() {
		fmt.Println("error")
		return nil
	}
	// Поменять местами корень и крайний правый лист (первый и последний элементы)
	h.swap(0, h.size()-1)
	// Удалить узел
	val := h.data[len(h.data)-1]
	h.data = h.data[:len(h.data)-1]
	// Просеивание вниз
	h.siftDown(0)

	// Вернуть элемент из корня
	return val
}

/* Просеивать вниз от узла i */
func (h *maxHeap) siftDown(i int) {
	for true {
		// Сохранить в max индекс наибольшего из узлов i, l и r
		l, r, max := h.left(i), h.right(i), i
		if l < h.size() && h.data[l].(int) > h.data[max].(int) {
			max = l
		}
		if r < h.size() && h.data[r].(int) > h.data[max].(int) {
			max = r
		}
		// Если ни у одного потомка значение не больше, чем у родителя, завершить просеивание
		if max == i {
			break
		}
		// Поменять два узла местами
		h.swap(i, max)
		// Продолжить просеивание вниз
		i = max
	}
}

/* Вывести кучу в виде бинарного дерева */
func (h *maxHeap) print() {
	PrintHeap(h.data)
}
