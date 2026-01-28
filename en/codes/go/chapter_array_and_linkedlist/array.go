// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* Random access to element */
func randomAccess(nums []int) (randomNum int) {
	// Randomly select a number in the interval [0, nums.length)
	randomIndex := rand.Intn(len(nums))
	// Retrieve and return the random element
	randomNum = nums[randomIndex]
	return
}

/* Extend array length */
func extend(nums []int, enlarge int) []int {
	// Initialize an array with extended length
	res := make([]int, len(nums)+enlarge)
	// Copy all elements from the original array to the new array
	for i, num := range nums {
		res[i] = num
	}
	// Return the extended new array
	return res
}

/* Insert element num at index index in the array */
func insert(nums []int, num int, index int) {
	// Move all elements at and after index index backward by one position
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// Assign num to the element at index index
	nums[index] = num
}

/* Remove the element at index index */
func remove(nums []int, index int) {
	// Move all elements after index index forward by one position
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* Traverse array */
func traverse(nums []int) {
	count := 0
	// Traverse array by index
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// Direct traversal of array elements
	for _, num := range nums {
		count += num
	}
	// Traverse simultaneously data index and elements
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* Find the specified element in the array */
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
