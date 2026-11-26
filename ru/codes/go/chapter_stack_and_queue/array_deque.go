// File: array_deque.go
// Created Time: 2023-03-13
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

import "fmt"

/* Двусторонняя очередь (дек) на основе кольцевого массива */
type arrayDeque struct {
	nums        []int // Массив для хранения элементов дека
	front       int   // Индекс первого элемента дека
	queSize     int   // Длина дека
	queCapacity int   // Ёмкость дека (максимальное число элементов)
}

/* Инициализировать дек */
func newArrayDeque(queCapacity int) *arrayDeque {
	return &arrayDeque{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Получить длину дека */
func (q *arrayDeque) size() int {
	return q.queSize
}

/* Проверить, пуст ли дек */
func (q *arrayDeque) isEmpty() bool {
	return q.queSize == 0
}

/* Вычислить индекс в кольцевом массиве */
func (q *arrayDeque) index(i int) int {
	// Операция взятия остатка связывает конец массива с его началом
	// Если индекс i выходит за конец массива, отсчёт продолжается с начала
	// Если индекс i выходит за начало массива, отсчёт продолжается с конца
	return (i + q.queCapacity) % q.queCapacity
}

/* Добавить элемент в начало дека */
func (q *arrayDeque) pushFirst(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Дек заполнен")
		return
	}
	// Сдвинуть индекс начала дека на одну позицию влево
	// При выходе за начало массива операция взятия остатка возвращает front в конец
	q.front = q.index(q.front - 1)
	// Добавить num в начало дека
	q.nums[q.front] = num
	q.queSize++
}

/* Добавить элемент в конец дека */
func (q *arrayDeque) pushLast(num int) {
	if q.queSize == q.queCapacity {
		fmt.Println("Дек заполнен")
		return
	}
	// Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
	rear := q.index(q.front + q.queSize)
	// Добавить num в конец дека
	q.nums[rear] = num
	q.queSize++
}

/* Извлечь элемент из начала дека */
func (q *arrayDeque) popFirst() any {
	num := q.peekFirst()
	if num == nil {
		return nil
	}
	// Сдвинуть индекс начала дека на одну позицию вперёд
	q.front = q.index(q.front + 1)
	q.queSize--
	return num
}

/* Извлечь элемент из конца дека */
func (q *arrayDeque) popLast() any {
	num := q.peekLast()
	if num == nil {
		return nil
	}
	q.queSize--
	return num
}

/* Посмотреть первый элемент дека */
func (q *arrayDeque) peekFirst() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Посмотреть последний элемент дека */
func (q *arrayDeque) peekLast() any {
	if q.isEmpty() {
		return nil
	}
	// Вычислить индекс последнего элемента
	last := q.index(q.front + q.queSize - 1)
	return q.nums[last]
}

/* Получить срез для вывода */
func (q *arrayDeque) toSlice() []int {
	// Преобразовать только те элементы, которые сейчас находятся в деке
	res := make([]int, q.queSize)
	for i, j := 0, q.front; i < q.queSize; i++ {
		res[i] = q.nums[q.index(j)]
		j++
	}
	return res
}
