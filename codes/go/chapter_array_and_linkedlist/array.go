// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* 随机访问元素 */
func randomAccess(nums []int) (randomNum int) {
	// 在区间 [0, nums.length) 中随机抽取一个数字
	randomIndex := rand.Intn(len(nums))
	// 获取并返回随机元素
	randomNum = nums[randomIndex]
	return
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
func insert(nums []int, num int, index int) {
	// 把索引 index 以及之后的所有元素向后移动一位
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// 将 num 赋给 index 处的元素
	nums[index] = num
}

/* 删除索引 index 处的元素 */
func remove(nums []int, index int) {
	// 把索引 index 之后的所有元素向前移动一位
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* 遍历数组 */
func traverse(nums []int) {
	count := 0
	// 通过索引遍历数组
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// 直接遍历数组元素
	for _, num := range nums {
		count += num
	}
	// 同时遍历数据索引和元素
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* 在数组中查找指定元素 */
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
