// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Driver code */
func TestMyList(t *testing.T) {
	/* Initialize the list */
	nums := newMyList()
	/* Append at the end */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("List nums = %v, capacity = %v, length = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* Insert an element in the middle */
	nums.insert(6, 3)
	fmt.Printf("Insert the number 6 at index 3, giving nums = %v\n", nums.toArray())

	/* Remove an element */
	nums.remove(3)
	fmt.Printf("Remove the element at index 3, giving nums = %v\n", nums.toArray())

	/* Access an element */
	num := nums.get(1)
	fmt.Printf("Access the element at index 1, giving num = %v\n", num)

	/* Update an element */
	nums.set(0, 1)
	fmt.Printf("Update the element at index 1 to 0, giving nums = %v\n", nums.toArray())

	/* Test capacity growth */
	for i := 0; i < 10; i++ {
		// When i = 5, the list length would exceed its capacity, triggering capacity growth
		nums.add(i)
	}
	fmt.Printf("After capacity growth: list nums = %v, capacity = %v, length = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
