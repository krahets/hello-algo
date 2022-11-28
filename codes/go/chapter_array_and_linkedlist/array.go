package main

import (
	"fmt"
	"math/rand"
	"time"
)

func randomAccess(nums []int) int {
	//随机访问元素
	rand.Seed(time.Now().UnixNano())
	RandomIndex := rand.Intn(len(nums)) //在区间 [0, len(nums)) 中随机抽取一个数字
	return nums[RandomIndex]
}
func extend(nums []int, enlarge int) []int {
	//初始化一个扩展长度后的数组
	res := make([]int, len(nums)+enlarge)
	//将原数组中的所有元素复制到新数组
	copy(res, nums)
	//返回扩展后的新数组
	return res
}
func insert(nums []int, index, num int) {
	//把索引 index 以及之后的所有元素向后移动一位
	copy(nums[index+1:], nums[index:])
	//将 num 赋给 index 处元素
	nums[index] = num
}
func remove(nums []int, index int) {
	//把索引 index 之后的所有元素向前移动一位
	copy(nums[index:], nums[index+1:])
}
func traverse(nums []int) {
	count := 0
	//通过索引遍历数组
	for i := 0; i < len(nums); i++ {
		count++
		fmt.Printf("%d ", nums[i])
	}
	fmt.Println()
	//直接遍历数组
	for _, i := range nums {
		count++
		fmt.Printf("%d ", i)
	}
}
func find(nums []int, target int) int {
	//在数组中查找指定元素
	for i := range nums {
		if nums[i] == target {
			return i
		}
	}
	return -1
}
func main() {
	//初始化数组
	arr := []int{1, 2, 3, 4, 5}
	//var nums []int

	arr = extend(arr, 2)

	insert(arr, 2, 99)
	remove(arr, 2)
	traverse(arr)
	fmt.Printf("%d", find(arr, 5))
}
