// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* Стек на основе массива */
type arrayStack struct {
	data []int // данные
}

/* Инициализировать стек */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// Установить длину стека равной 0, а вместимость равной 16
		data: make([]int, 0, 16),
	}
}

/* Длина стека */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* стекпуст ли */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* Поместить в стек */
func (s *arrayStack) push(v int) {
	// Срез будет автоматически расширяться
	s.data = append(s.data, v)
}

/* Извлечь из стека */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* Получить элемент на вершине стека */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* Получить Slice для вывода */
func (s *arrayStack) toSlice() []int {
	return s.data
}
