// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* Двусторонняя очередь на основе циклического массива */
type arrayDeque struct {
	nums        []int // Массив для хранения элементов двусторонней очереди
	front       int   // Указатель front, указывающий на первый элемент очереди
	queSize     int   // Длина двусторонней очереди
	queCapacity int   // Вместимость очереди (то есть максимальное число элементов)
}

/* Инициализировать очередь */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Получить длину двусторонней очереди */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* Проверить, пуста ли двусторонняя очередь */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* Вычислить индекс циклического массива */
func (q *arrayDeque) index(i int) int {
	// Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
	// Когда i выходит за конец массива, он возвращается к началу
	// Когда i выходит за начало массива, он возвращается к концу
	return (i + q.queCapacity) % q.queCapacity
}

/* Поместить в голову очереди */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("двусторонняя очередьзаполнен")
		return
	}
	// Указатель головы очереди сдвигается на одну позицию влево
	// Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
	q.front = q.index(q.front - 1)
	// Добавить num в голову очереди
	q.nums[q.front] = num
	q.queSize++
}

/* Поместить в хвост очереди */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("двусторонняя очередьзаполнен")
		return
	}
	// Вычислить указатель хвоста, указывающий на индекс за последним элементом
	rear := q.index(q.front + q.queSize)
	// Добавить num в конец очереди
	q.nums[rear] = num
	q.queSize++
}

/* Извлечь из головы очереди */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// Указатель головы очереди сдвигается на одну позицию вперед
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* Извлечь из хвоста очереди */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* Получить элемент в начале очереди */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Обратиться к элементу в хвосте очереди */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// Вычислить индекс хвостового элемента
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* Получить Slice для вывода */
func (q *arrayDeque) toSlice() []int {
	// Преобразовать только элементы списка в пределах действительной длины
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
