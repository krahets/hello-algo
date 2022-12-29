// File: array.go
// Created Time: 2022-12-29
// Author: cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"math/rand"
)

/* 初始化数组 */
var arr = [5]int{}
var nums = []int{1, 3, 2, 5, 4}

/* 随机返回一个数组元素 */
func randomAccess(nums []int) int {
	randomIndex := rand.Intn(len(nums))
	randomNum := nums[randomIndex]
	return randomNum
}

/* 扩展数组长度 */
func extend(nums []int, enlarge int) []int {
	// 初始化一个扩展长度后的数组
	res := make([]int, len(nums)+enlarge)
	// 将原数组中的所有元素复制到新数组
	for i, num := range nums {
		res[i] = num
	}
	// 返回扩展后的新数组
	return res
}

/* 在数组的索引 index 处插入元素 num */
func insert(nums []int, size int, num int, index int) {
	// 把索引 index 以及之后的所有元素向后移动一位
	for i := size - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// 将 num 赋给 index 处元素
	nums[index] = num
}

/* 删除索引 index 处元素 */
func remove(nums []int, size int, index int) {
	// 把索引 index 之后的所有元素向前移动一位
	for i := index; i < size-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* 遍历数组 */
func traverse(nums []int) {
	count := 0
	// 通过索引遍历数组
	for i := 0; i < len(nums); i++ {
		count++
	}
	fmt.Println(count)

	count = 0
	// 直接遍历数组
	for range nums {
		count++
	}
	fmt.Println(count)
}

/* 在数组中查找指定元素，返回第一个索引位置，未查找到则返回 -1 */
func find(nums []int, target int) int {
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			return i
		}
	}
	return -1
}
