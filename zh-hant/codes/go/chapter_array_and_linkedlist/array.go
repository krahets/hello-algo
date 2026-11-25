// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* 隨機存取元素 */
func randomAccess(nums []int) (randomNum int) {
	// 從區間 [0, nums.length) 隨機選取一個數
	randomIndex := rand.Intn(len(nums))
	// 取得並回傳隨機選出的元素
	randomNum = nums[randomIndex]
	return
}

/* 增加陣列長度 */
func extend(nums []int, enlarge int) []int {
	// 初始化加長後的陣列
	res := make([]int, len(nums)+enlarge)
	// 將原陣列的所有元素複製到新陣列
	for i, num := range nums {
		res[i] = num
	}
	// 回傳加長後的新陣列
	return res
}

/* 在陣列的索引 index 處插入元素 num */
func insert(nums []int, num int, index int) {
	// 將索引 index 起的所有元素往後移一格
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// 將 num 指派給索引 index 處的元素
	nums[index] = num
}

/* 刪除索引 index 處的元素 */
func remove(nums []int, index int) {
	// 將索引 index 之後的所有元素往前移一格
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* 走訪陣列 */
func traverse(nums []int) {
	count := 0
	// 依索引走訪陣列
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// 直接走訪陣列中的元素
	for _, num := range nums {
		count += num
	}
	// 同時走訪資料的索引和元素
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* 在陣列中尋找指定元素 */
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
