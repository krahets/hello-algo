// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* 串列類別 */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* 建構子 */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // 串列容量
		arr:         make([]int, 10), // 陣列（儲存串列元素）
		arrSize:     0,               // 串列長度（當前元素數量）
		extendRatio: 2,               // 每次串列擴容的倍數
	}
}

/* 獲取串列長度（當前元素數量） */
func (l *myList) size() int {
	return l.arrSize
}

/*  獲取串列容量 */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* 訪問元素 */
func (l *myList) get(index int) int {
	// 索引如果越界，則丟擲異常，下同
	if index < 0 || index >= l.arrSize {
		panic("索引越界")
	}
	return l.arr[index]
}

/* 更新元素 */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("索引越界")
	}
	l.arr[index] = num
}

/* 在尾部新增元素 */
func (l *myList) add(num int) {
	// 元素數量超出容量時，觸發擴容機制
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// 更新元素數量
	l.arrSize++
}

/* 在中間插入元素 */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("索引越界")
	}
	// 元素數量超出容量時，觸發擴容機制
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// 將索引 index 以及之後的元素都向後移動一位
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// 更新元素數量
	l.arrSize++
}

/* 刪除元素 */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("索引越界")
	}
	num := l.arr[index]
	// 將索引 index 之後的元素都向前移動一位
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// 更新元素數量
	l.arrSize--
	// 返回被刪除的元素
	return num
}

/* 串列擴容 */
func (l *myList) extendCapacity() {
	// 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// 更新串列容量
	l.arrCapacity = len(l.arr)
}

/* 返回有效長度的串列 */
func (l *myList) toArray() []int {
	// 僅轉換有效長度範圍內的串列元素
	return l.arr[:l.arrSize]
}
