package chapter_array_and_linkedlist

import (
	"fmt"
	"math/rand"
)

// ExpectSize 预期大小。 在 Go 中，声明数组长度必须是常量表达式，
// 所以这里我们约定，扩展后的长度为 6
const ExpectSize = 6

/* 随机返回一个数组元素 */
func randomAccess(nums [5]int) (ans int) {
	// 在区间 [0, nums.length) 中随机抽取一个数字
	randomIndex := rand.Intn(len(nums))
	// 获取并返回随机元素
	ans = nums[randomIndex]
	return
}

/* 扩展数组长度 */
func extend(nums [5]int) [ExpectSize]int {
	// 初始化一个扩展长度后的数组
	var res [ExpectSize]int
	// 将原数组中的所有元素复制到新数组
	for i := 0; i < len(nums); i++ {
		res[i] = nums[i]
	}
	// 返回扩展后的新数组
	return res
}

/* 在数组的索引 index 处插入元素 num */
func insert(nums *[5]int, num int, index int) {
	// 把索引 index 以及之后的所有元素向后移动一位
	// 如果超出了数组长度，会被直接舍弃
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// 将 num 赋给 index 处元素
	nums[index] = num
}

/* 删除索引 index 处元素 */
func remove(nums *[5]int, index int) {
	// 越界检查
	if index >= len(nums) {
		return
	}
	// 把索引 index 之后的所有元素向前移动一位
	for i := index; i < len(nums); i++ {
		if i+1 >= len(nums) {
			nums[len(nums)-1] = 0
			break
		}
		nums[i] = nums[i+1]
	}
}

/* 遍历数组 */
func traverse(nums [5]int) {
	var count int
	// 通过索引遍历数组
	for i := 0; i < len(nums); i++ {
		count++
	}
	// 直接遍历数组
	for index, val := range nums {
		fmt.Printf("index:%v value:%v\n", index, val)
	}
}

/* 在数组中查找指定元素 */
func find(nums [5]int, target int) (ans int) {
	ans = -1
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			ans = i
			break
		}
	}
	return
}
