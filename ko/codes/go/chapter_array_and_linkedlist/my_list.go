// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* 리스트 클래스 */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* 생성자 */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // 리스트 용량
		arr:         make([]int, 10), // 배열(리스트 원소 저장)
		arrSize:     0,               // 리스트 길이(현재 원소 수)
		extendRatio: 2,               // 리스트 용량을 늘릴 때마다 적용하는 배수
	}
}

/* 리스트 길이(현재 원소 수) 구하기 */
func (l *myList) size() int {
	return l.arrSize
}

/*  리스트 용량 구하기 */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* 원소 접근 */
func (l *myList) get(index int) int {
	// 인덱스가 범위를 벗어나면 예외를 던진다. 이하에서도 같다.
	if index < 0 || index >= l.arrSize {
		panic("인덱스 범위 초과")
	}
	return l.arr[index]
}

/* 원소 갱신 */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("인덱스 범위 초과")
	}
	l.arr[index] = num
}

/* 맨 뒤에 원소 추가 */
func (l *myList) add(num int) {
	// 원소 수가 용량을 초과하면 용량을 늘린다.
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// 원소 수 갱신
	l.arrSize++
}

/* 중간에 원소 삽입 */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("인덱스 범위 초과")
	}
	// 원소 수가 용량을 초과하면 용량을 늘린다.
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// 인덱스 index부터 끝까지 원소를 뒤로 한 칸씩 이동
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// 원소 수 갱신
	l.arrSize++
}

/* 원소 삭제 */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("인덱스 범위 초과")
	}
	num := l.arr[index]
	// 인덱스 index 다음의 원소를 모두 앞으로 한 칸씩 이동
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// 원소 수 갱신
	l.arrSize--
	// 삭제한 원소 반환
	return num
}

/* 리스트 용량 늘리기 */
func (l *myList) extendCapacity() {
	// 원래 배열 길이의 extendRatio배인 새 배열을 만들고 원래 배열을 복사
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// 리스트 용량 갱신
	l.arrCapacity = len(l.arr)
}

/* 유효한 길이만큼의 리스트 반환 */
func (l *myList) toArray() []int {
	// 유효한 길이 범위 안의 리스트 원소만 변환
	return l.arr[:l.arrSize]
}
