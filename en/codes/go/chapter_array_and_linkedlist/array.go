// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* Access a random element */
func randomAccess(nums []int) (randomNum int) {
	// Pick a random index in [0, nums.length)
	randomIndex := rand.Intn(len(nums))
	// Get and return the element at that index
	randomNum = nums[randomIndex]
	return
}

/* Extend the array */
func extend(nums []int, enlarge int) []int {
	// Initialize an array with the new length
	res := make([]int, len(nums)+enlarge)
	// Copy all elements from the original array into the new array
	for i, num := range nums {
		res[i] = num
	}
	// Return the new, longer array
	return res
}

/* Insert num at the specified array index */
func insert(nums []int, num int, index int) {
	// Shift the elements from index onward one position to the right
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// Store num at the specified index
	nums[index] = num
}

/* Remove the element at the specified index */
func remove(nums []int, index int) {
	// Shift all elements after index one position to the left
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
	// Iterate over indices and elements together
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* Find a given element in the array */
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
