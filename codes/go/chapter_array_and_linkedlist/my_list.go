// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* 列表类简易实现 */
type myList struct {
	numsCapacity int
	nums         []int
	numsSize     int
	extendRatio  int
}

/* 构造方法 */
func newMyList() *myList {
	return &myList{
		numsCapacity: 10,              // 列表容量
		nums:         make([]int, 10), // 数组（存储列表元素）
		numsSize:     0,               // 列表长度（即当前元素数量）
		extendRatio:  2,               // 每次列表扩容的倍数
	}
}

/* 获取列表长度（即当前元素数量） */
func (l *myList) size() int {
	return l.numsSize
}

/*  获取列表容量 */
func (l *myList) capacity() int {
	return l.numsCapacity
}

/* 访问元素 */
func (l *myList) get(index int) int {
	// 索引如果越界则抛出异常，下同
	if index < 0 || index >= l.numsSize {
		panic("索引越界")
	}
	return l.nums[index]
}

/* 更新元素 */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.numsSize {
		panic("索引越界")
	}
	l.nums[index] = num
}

/* 尾部添加元素 */
func (l *myList) add(num int) {
	// 元素数量超出容量时，触发扩容机制
	if l.numsSize == l.numsCapacity {
		l.extendCapacity()
	}
	l.nums[l.numsSize] = num
	// 更新元素数量
	l.numsSize++
}

/* 中间插入元素 */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.numsSize {
		panic("索引越界")
	}
	// 元素数量超出容量时，触发扩容机制
	if l.numsSize == l.numsCapacity {
		l.extendCapacity()
	}
	// 索引 i 以及之后的元素都向后移动一位
	for j := l.numsSize - 1; j >= index; j-- {
		l.nums[j+1] = l.nums[j]
	}
	l.nums[index] = num
	// 更新元素数量
	l.numsSize++
}

/* 删除元素 */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.numsSize {
		panic("索引越界")
	}
	num := l.nums[index]
	// 索引 i 之后的元素都向前移动一位
	for j := index; j < l.numsSize-1; j++ {
		l.nums[j] = l.nums[j+1]
	}
	// 更新元素数量
	l.numsSize--
	// 返回被删除元素
	return num
}

/* 列表扩容 */
func (l *myList) extendCapacity() {
	// 新建一个长度为 self.__size 的数组，并将原数组拷贝到新数组
	l.nums = append(l.nums, make([]int, l.numsCapacity*(l.extendRatio-1))...)
	// 更新列表容量
	l.numsCapacity = len(l.nums)
}

/* 返回有效长度的列表 */
func (l *myList) toArray() []int {
	// 仅转换有效长度范围内的列表元素
	return l.nums[:l.numsSize]
}
