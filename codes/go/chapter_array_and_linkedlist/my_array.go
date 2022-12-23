// File: my_array.go
// Created Time: 2022-12-22
// Author: kesq (nosqlcoco@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"math/rand"
	"time"
)

/* 随机返回一个数组元素 */
func randomAccess(nums []int) int {
	// 设置随机种子数
	rand.Seed(time.Now().UnixNano())
	// 在区间 [0, len(nums)) 中随机抽取一个数字
	var randomIndex = rand.Intn(len(nums))
	// 获取并返回随机元素
	var randomNum = nums[randomIndex]
	return randomNum
}

func extend(nums []int, enlarge int) []int {
	// 初始化一个扩展长度后的数组(切片)
	var res = make([]int, len(nums)+enlarge)
	// 将原数组中的所有元素复制到新数组
	// copy是Go内置函数，用于将一个数组里的元素拷贝到另一个数组copy(dst, src)
	copy(res, nums)
	// 返回扩展后的新数组
	return res
}

/* 在数组的索引 index 处插入元素 num */
func insert(nums []int, num int, index int) []int {
	// 初始化数组
	var res = []int{}
	// 截取nums index前的元素放入res
	// append是Go的内置函数,用于往数组中追加元素
	res = append(res, nums[:index]...)
	// 将num元素放入index索引的位置
	res = append(res, num)
	// 截取nums index后的元素放入res
	res = append(res, nums[index:]...)
	return res
}

/* 删除索引 index 处元素 */
func remove(nums []int, index int) []int {
	// 初始化数组
	var res = []int{}
	// 截取nums index前的元素放入res
	// append是Go的内置函数,用于往数组中追加元素
	res = append(res, nums[:index]...)
	// 截取nums index后的元素放入res
	res = append(res, nums[index+1:]...)
	return res
}

/* 遍历数组 */
func traverse(nums []int) {
	var count = 0
	// 通过索引遍历数组
	for i := 0; i < len(nums); i++ {
		count++
	}
	// 直接遍历数组
	for i, v := range nums {
		count++
		// 这里辅助打印变量i和v, 因为在Go中如果申明变量而不使用无法编译通过
		fmt.Printf("index: %d, value: %d\n", i, v)
	}
}

/* 在数组中查找指定元素 */
func find(nums []int, target int) int {
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			return i
		}
	}
	return -1
}
