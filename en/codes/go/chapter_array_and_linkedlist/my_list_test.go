// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestMyList(t *testing.T) {
	/* Initialize list */
	nums := newMyList()
	/* Add element at the end */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("List nums = %v, capacity = %v, length = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* Insert element in the middle */
	nums.insert(6, 3)
	fmt.Printf("Insert the number 6 at index 3, resulting in nums = %v\n", nums.toArray())

	/* Remove element */
	nums.remove(3)
	fmt.Printf("Remove the element at index 3, resulting in nums = %v\n", nums.toArray())

	/* Access element */
	num := nums.get(1)
	fmt.Printf("Access the element at index 1, resulting in num = %v\n", num)

	/* Update element */
	nums.set(0, 1)
	fmt.Printf("Update the element at index 1 to 0, resulting in nums = %v\n", nums.toArray())

	/* Test expansion mechanism */
	for i := 0; i < 10; i++ {
		// At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism at this time
		nums.add(i)
	}
	fmt.Printf("After extending, list nums = %v, capacity = %v, length = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
