// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* 列表类 */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* 构造函数 */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // 列表容量
		arr:         make([]int, 10), // 数组（存储列表元素）
		arrSize:     0,               // 列表长度（当前元素数量）
		extendRatio: 2,               // 每次列表扩容的倍数
	}
}

/* 获取列表长度（当前元素数量） */
func (l *myList) size() int {
	return l.arrSize
}

/*  获取列表容量 */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* 访问元素 */
func (l *myList) get(index int) int {
	// 索引如果越界，则抛出异常，下同
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

/* 在尾部添加元素 */
func (l *myList) add(num int) {
	// 元素数量超出容量时，触发扩容机制
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// 更新元素数量
	l.arrSize++
}

/* 在中间插入元素 */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("索引越界")
	}
	// 元素数量超出容量时，触发扩容机制
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// 将索引 index 以及之后的元素都向后移动一位
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// 更新元素数量
	l.arrSize++
}

/* 删除元素 */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("索引越界")
	}
	num := l.arr[index]
	// 将索引 index 之后的元素都向前移动一位
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// 更新元素数量
	l.arrSize--
	// 返回被删除的元素
	return num
}

/* 列表扩容 */
func (l *myList) extendCapacity() {
	// 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// 更新列表容量
	l.arrCapacity = len(l.arr)
}

/* 返回有效长度的列表 */
func (l *myList) toArray() []int {
	// 仅转换有效长度范围内的列表元素
	return l.arr[:l.arrSize]
}
