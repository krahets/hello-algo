// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Очередь на основе циклического массива */
type arrayQueue struct {
	nums        []int // Массив для хранения элементов очереди
	front       int   // Указатель front, указывающий на первый элемент очереди
	queSize     int   // Длина очереди
	queCapacity int   // Вместимость очереди (то есть максимальное число элементов)
}

/* Инициализировать очередь */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Получить длину очереди */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* Проверить, пуста ли очередь */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* Поместить в очередь */
func (q *arrayQueue) push(num int) {
	// Когда rear == queCapacity, очередь считается заполненной
	if q.queSize == q.queCapacity {
		return
	}
	// Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
	// Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
	rear := (q.front + q.queSize) % q.queCapacity
	// Добавить num в конец очереди
	q.nums[rear] = num
	q.queSize++
}

/* Извлечь из очереди */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* Получить элемент в начале очереди */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Получить Slice для вывода */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
