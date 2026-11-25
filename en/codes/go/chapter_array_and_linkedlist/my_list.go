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
		arr:         make([]int, 10), // Array that stores the list elements
		arrSize:     0,               // List length (current number of elements)
		extendRatio: 2,               // Factor by which the list capacity grows
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
	// Throw an exception if the index is out of bounds, here and below
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

/* Append an element */
func (l *myList) add(num int) {
	// Increase capacity when the elements would no longer fit
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// Update the element count
	l.arrSize++
}

/* Insert an element in the middle */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	// Increase capacity when the elements would no longer fit
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// Shift the elements from index onward one position to the right
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// Update the element count
	l.arrSize++
}

/* Remove an element */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	num := l.arr[index]
	// Shift the elements after index one position to the left
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// Update the element count
	l.arrSize--
	// Return the removed element
	return num
}

/* Increase the list capacity */
func (l *myList) extendCapacity() {
	// Create an array extendRatio times as long and copy the original array into it
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// Update the list capacity
	l.arrCapacity = len(l.arr)
}

/* Return the list up to its current length */
func (l *myList) toArray() []int {
	// Convert only the elements within the current list length
	return l.arr[:l.arrSize]
}
