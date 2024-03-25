// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* 隨機訪問元素 */
func randomAccess(nums []int) (randomNum int) {
	// 在區間 [0, nums.length) 中隨機抽取一個數字
	randomIndex := rand.Intn(len(nums))
	// 獲取並返回隨機元素
	randomNum = nums[randomIndex]
	return
}

/* 擴展陣列長度 */
func extend(nums []int, enlarge int) []int {
	// 初始化一個擴展長度後的陣列
	res := make([]int, len(nums)+enlarge)
	// 將原陣列中的所有元素複製到新陣列
	for i, num := range nums {
		res[i] = num
	}
	// 返回擴展後的新陣列
	return res
}

/* 在陣列的索引 index 處插入元素 num */
func insert(nums []int, num int, index int) {
	// 把索引 index 以及之後的所有元素向後移動一位
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// 將 num 賦給 index 處的元素
	nums[index] = num
}

/* 刪除索引 index 處的元素 */
func remove(nums []int, index int) {
	// 把索引 index 之後的所有元素向前移動一位
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* 走訪陣列 */
func traverse(nums []int) {
	count := 0
	// 透過索引走訪陣列
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// 直接走訪陣列元素
	for _, num := range nums {
		count += num
	}
	// 同時走訪資料索引和元素
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* 在陣列中查詢指定元素 */
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
