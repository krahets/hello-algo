// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* Двусторонняя очередь на основе кольцевого массива */
type arrayDeque struct {
	nums        []int // Массив для хранения элементов двусторонней очереди
	front       int   // Указатель head, указывающий на первый элемент очереди
	queSize     int   // Длина двусторонней очереди
	queCapacity int   // Вместимость очереди (то есть максимальное число элементов)
}

/* Инициализация очереди */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Получение длины двусторонней очереди */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* Проверка, пуста ли двусторонняя очередь */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* Вычислить индекс в кольцевом массиве */
func (q *arrayDeque) index(i int) int {
	// С помощью операции взятия по модулю соединить начало и конец массива
	// Когда i выходит за конец массива, он возвращается в начало
	// Когда i выходит за начало массива, он возвращается в конец
	return (i + q.queCapacity) % q.queCapacity
}

/* Добавление в голову очереди */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Двусторонняя очередь заполнена")
		return
	}
	// Указатель головы сдвигается на одну позицию влево
	// С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
	q.front = q.index(q.front - 1)
	// Добавить num в голову очереди
	q.nums[q.front] = num
	q.queSize++
}

/* Добавление в хвост очереди */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Двусторонняя очередь заполнена")
		return
	}
	// Вычислить указатель хвоста, указывающий на индекс хвоста + 1
	rear := q.index(q.front + q.queSize)
	// Добавить num в хвост очереди
	q.nums[rear] = num
	q.queSize++
}

/* Извлечение из головы очереди */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// Указатель головы сдвигается на одну позицию назад
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* Извлечение из хвоста очереди */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* Доступ к элементу в начале очереди */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Доступ к элементу в конце очереди */
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
	// Преобразовывать только элементы списка в пределах фактической длины
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
