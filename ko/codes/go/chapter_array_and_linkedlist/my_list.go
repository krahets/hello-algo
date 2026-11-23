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
		arrSize:     0,               // 리스트 길이(현재 원소 개수)
		extendRatio: 2,               // 리스트의 용량을 확장할 때마다 적용하는 배수
	}
}

/* 리스트 길이(현재 원소 개수) 반환 */
func (l *myList) size() int {
	return l.arrSize
}

/*  리스트 용량 반환 */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* 원소 접근 */
func (l *myList) get(index int) int {
	// 인덱스가 범위를 벗어나면 예외를 발생시킨다. 아래에서도 동일하다
	if index < 0 || index >= l.arrSize {
		panic("인덱스가 범위를 벗어났다")
	}
	return l.arr[index]
}

/* 원소 갱신 */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("인덱스가 범위를 벗어났다")
	}
	l.arr[index] = num
}

/* 맨 뒤에 원소 추가 */
func (l *myList) add(num int) {
	// 원소 개수가 용량을 초과하면 용량 확장을 수행한다
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// 원소 개수를 갱신한다
	l.arrSize++
}

/* 중간에 원소 삽입 */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("인덱스가 범위를 벗어났다")
	}
	// 원소 개수가 용량을 초과하면 용량 확장을 수행한다
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// 원소 개수를 갱신한다
	l.arrSize++
}

/* 원소 삭제 */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("인덱스가 범위를 벗어났다")
	}
	num := l.arr[index]
	// 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// 원소 개수를 갱신한다
	l.arrSize--
	// 삭제한 원소를 반환한다
	return num
}

/* 리스트 용량 확장 */
func (l *myList) extendCapacity() {
	// 길이가 원래 배열의 extendRatio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// 리스트 용량을 갱신한다
	l.arrCapacity = len(l.arr)
}

/* 유효한 길이만큼의 리스트 반환 */
func (l *myList) toArray() []int {
	// 유효한 길이 범위 안의 리스트 원소만 변환한다
	return l.arr[:l.arrSize]
}
