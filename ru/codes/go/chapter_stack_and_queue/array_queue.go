// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Очередь на основе кольцевого массива */
type arrayQueue struct {
	nums        []int // Массив для хранения элементов очереди
	front       int   // Индекс первого элемента очереди
	queSize     int   // Длина очереди
	queCapacity int   // Ёмкость очереди (максимальное число элементов)
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

/* Добавить элемент в очередь */
func (q *arrayQueue) push(num int) {
	// Равенство queSize == queCapacity означает, что очередь заполнена
	if q.queSize == q.queCapacity {
		return
	}
	// Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
	// При выходе за конец массива операция взятия остатка возвращает rear в начало
	rear := (q.front + q.queSize) % q.queCapacity
	// Добавить num в конец очереди
	q.nums[rear] = num
	q.queSize++
}

/* Извлечь элемент из очереди */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* Посмотреть первый элемент очереди */
func (q *arrayQueue) peek() any {
	if q.isEmpty() {
		return nil
	}
	return q.nums[q.front]
}

/* Получить срез для вывода */
func (q *arrayQueue) toSlice() []int {
	rear := (q.front + q.queSize)
	if rear >= q.queCapacity {
		rear %= q.queCapacity
		return append(q.nums[q.front:], q.nums[:rear]...)
	}
	return q.nums[q.front:rear]
}
