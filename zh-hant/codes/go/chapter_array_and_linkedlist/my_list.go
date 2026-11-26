// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* 列表類別 */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* 建構函式 */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // 列表容量
		arr:         make([]int, 10), // 陣列（用來儲存列表元素）
		arrSize:     0,               // 列表長度（目前的元素數量）
		extendRatio: 2,               // 每次擴充列表容量的倍數
	}
}

/* 取得列表長度（目前的元素數量） */
func (l *myList) size() int {
	return l.arrSize
}

/*  取得列表容量 */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* 存取元素 */
func (l *myList) get(index int) int {
	// 若索引超出範圍，就拋出例外，以下同理
	if index < 0 || index >= l.arrSize {
		panic("索引超出範圍")
	}
	return l.arr[index]
}

/* 更新元素 */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("索引超出範圍")
	}
	l.arr[index] = num
}

/* 在尾端加入元素 */
func (l *myList) add(num int) {
	// 若加入元素後數量將超過容量，就觸發擴充機制
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
		panic("索引超出範圍")
	}
	// 若加入元素後數量將超過容量，就觸發擴充機制
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// 將索引 index 起的所有元素往後移一格
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
		panic("索引超出範圍")
	}
	num := l.arr[index]
	// 將索引 index 之後的所有元素往前移一格
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// 更新元素數量
	l.arrSize--
	// 回傳刪除的元素
	return num
}

/* 擴充列表容量 */
func (l *myList) extendCapacity() {
	// 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// 更新列表容量
	l.arrCapacity = len(l.arr)
}

/* 回傳僅包含有效元素的列表 */
func (l *myList) toArray() []int {
	// 僅轉換列表有效長度範圍內的元素
	return l.arr[:l.arrSize]
}
