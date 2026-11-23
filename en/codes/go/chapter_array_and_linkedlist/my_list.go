// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* List type */
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
		arr:         make([]int, 10), // Array (stores the list elements)
		arrSize:     0,               // List length (current number of elements)
		extendRatio: 2,               // Factor by which the list capacity grows each time
	}
}

/* Get the list length (current number of elements) */
func (l *myList) size() int {
	return l.arrSize
}

/*  Get the list capacity */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* Access an element */
func (l *myList) get(index int) int {
	// Panic if the index is out of bounds; the same applies below
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	return l.arr[index]
}

/* Update an element */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	l.arr[index] = num
}

/* Append at the end */
func (l *myList) add(num int) {
	// Grow the capacity when adding an element would exceed it
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// Update the number of elements
	l.arrSize++
}

/* Insert an element in the middle */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	// Grow the capacity when adding an element would exceed it
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// Shift all elements at and after index `index` one position to the right
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// Update the number of elements
	l.arrSize++
}

/* Remove an element */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	num := l.arr[index]
	// Shift all elements after index `index` one position to the left
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// Update the number of elements
	l.arrSize--
	// Return the removed element
	return num
}

/* Grow the list capacity */
func (l *myList) extendCapacity() {
	// Extend the backing slice to extendRatio times its original length, preserving the existing elements
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// Update the list capacity
	l.arrCapacity = len(l.arr)
}

/* Return the portion of the list that contains elements */
func (l *myList) toArray() []int {
	// Return a slice containing only the occupied elements
	return l.arr[:l.arrSize]
}
