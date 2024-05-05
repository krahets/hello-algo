// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* List class */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* Constructor */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // List capacity
		arr:         make([]int, 10), // Array (stores list elements)
		arrSize:     0,               // List length (current number of elements)
		extendRatio: 2,               // Multiple for each list expansion
	}
}

/* Get list length (current number of elements) */
func (l *myList) size() int {
	return l.arrSize
}

/*  Get list capacity */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* Access element */
func (l *myList) get(index int) int {
	// If the index is out of bounds, throw an exception, as below
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	return l.arr[index]
}

/* Update element */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	l.arr[index] = num
}

/* Add element at the end */
func (l *myList) add(num int) {
	// When the number of elements exceeds capacity, trigger the expansion mechanism
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// Update the number of elements
	l.arrSize++
}

/* Insert element in the middle */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	// When the number of elements exceeds capacity, trigger the expansion mechanism
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// Move all elements after `index` one position backward
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// Update the number of elements
	l.arrSize++
}

/* Remove element */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	num := l.arr[index]
	// Move all elements after `index` one position forward
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// Update the number of elements
	l.arrSize--
	// Return the removed element
	return num
}

/* Extend list */
func (l *myList) extendCapacity() {
	// Create a new array with a length multiple of the original array by extendRatio, and copy the original array to the new array
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// Update list capacity
	l.arrCapacity = len(l.arr)
}

/* Return a list of valid lengths */
func (l *myList) toArray() []int {
	// Only convert elements within valid length range
	return l.arr[:l.arrSize]
}
