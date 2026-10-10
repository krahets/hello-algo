// File: array_queue.go
// Created Time: 2022-11-28
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Очередь на основе кольцевого массива */
type arrayQueue struct {
	nums        []int // Массив для хранения элементов очереди
	front       int   // Указатель head, указывающий на первый элемент очереди
	queSize     int   // Длина очереди
	queCapacity int   // Вместимость очереди (то есть максимальное число элементов)
}

/* Инициализация очереди */
func newArrayQueue(queCapacity int) *arrayQueue {
	return &arrayQueue{
		nums:        make([]int, queCapacity),
		queCapacity: queCapacity,
		front:       0,
		queSize:     0,
	}
}

/* Получение длины очереди */
func (q *arrayQueue) size() int {
	return q.queSize
}

/* Проверка, пуста ли очередь */
func (q *arrayQueue) isEmpty() bool {
	return q.queSize == 0
}

/* Поместить в очередь */
func (q *arrayQueue) push(num int) {
	// Когда rear == queCapacity, очередь заполнена
	if q.queSize == q.queCapacity {
		return
	}
	// Вычислить указатель хвоста, указывающий на индекс хвоста + 1
	// С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
	rear := (q.front + q.queSize) % q.queCapacity
	// Добавить num в хвост очереди
	q.nums[rear] = num
	q.queSize++
}

/* Извлечь из очереди */
func (q *arrayQueue) pop() any {
	num := q.peek()
	if num == nil {
		return nil
	}

	// Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
	q.front = (q.front + 1) % q.queCapacity
	q.queSize--
	return num
}

/* Доступ к элементу в начале очереди */
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
