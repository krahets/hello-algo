// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* Access an element at a random index */
func randomAccess(nums []int) (randomNum int) {
	// Choose a random number in the interval [0, len(nums))
	randomIndex := rand.Intn(len(nums))
	// Get and return the randomly selected element
	randomNum = nums[randomIndex]
	return
}

/* Extend the array length */
func extend(nums []int, enlarge int) []int {
	// Initialize an array with the extended length
	res := make([]int, len(nums)+enlarge)
	// Copy all elements from the original array to the new array
	for i, num := range nums {
		res[i] = num
	}
	// Return the new, extended array
	return res
}

/* Insert element num at index `index` in the array */
func insert(nums []int, num int, index int) {
	// Shift all elements at and after index `index` one position to the right
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// Assign num to the element at index `index`
	nums[index] = num
}

/* Remove the element at index `index` */
func remove(nums []int, index int) {
	// Shift all elements after index `index` one position to the left
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* Traverse the array */
func traverse(nums []int) {
	count := 0
	// Traverse the array by index
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// Iterate directly over the array elements
	for _, num := range nums {
		count += num
	}
	// Iterate over both the indices and the elements
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* Find a specified element in the array */
func find(nums []int, target int) (index int) {
	index = -1
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			index = i
			break
		}
	}
	return
}
