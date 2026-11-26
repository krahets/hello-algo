// File: array_stack.go
// Created Time: 2022-11-26
// Author: Reanon (793584285@qq.com)

package chapter_stack_and_queue

/* 배열로 구현한 스택 */
type arrayStack struct {
	data []int // 데이터
}

/* 스택 초기화 */
func newArrayStack() *arrayStack {
	return &arrayStack{
		// 스택의 길이를 0으로, 용량을 16으로 설정한다
		data: make([]int, 0, 16),
	}
}

/* 스택의 길이 */
func (s *arrayStack) size() int {
	return len(s.data)
}

/* 스택이 비어 있는지 확인 */
func (s *arrayStack) isEmpty() bool {
	return s.size() == 0
}

/* 스택에 삽입 */
func (s *arrayStack) push(v int) {
	// 슬라이스의 용량은 자동으로 늘어난다
	s.data = append(s.data, v)
}

/* 스택에서 꺼내기 */
func (s *arrayStack) pop() any {
	val := s.peek()
	s.data = s.data[:len(s.data)-1]
	return val
}

/* 스택 맨 위의 원소 조회 */
func (s *arrayStack) peek() any {
	if s.isEmpty() {
		return nil
	}
	val := s.data[len(s.data)-1]
	return val
}

/* 출력에 사용할 슬라이스 반환 */
func (s *arrayStack) toSlice() []int {
	return s.data
}
