// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
我们将 Go 中的 Slice 切片看作 Array 数组。因为这样可以
降低理解成本，利于我们将关注点放在数据结构与算法上。
*/

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestArray(t *testing.T) {
	/* 初始化数组 */
	var arr [5]int
	fmt.Println("数组 arr =", arr)
	// 在 Go 中，指定长度时（[5]int）为数组，不指定长度时（[]int）为切片
	// 由于 Go 的数组被设计为在编译期确定长度，因此只能使用常量来指定长度
	// 为了方便实现扩容 extend() 函数，以下将切片（Slice）看作数组（Array）
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("数组 nums =", nums)

	/* 随机访问 */
	randomNum := randomAccess(nums)
	fmt.Println("在 nums 中获取随机元素", randomNum)

	/* 长度扩展 */
	nums = extend(nums, 3)
	fmt.Println("将数组长度扩展至 8 ，得到 nums =", nums)

	/* 插入元素 */
	insert(nums, 6, 3)
	fmt.Println("在索引 3 处插入数字 6 ，得到 nums =", nums)

	/* 删除元素 */
	remove(nums, 2)
	fmt.Println("删除索引 2 处的元素，得到 nums =", nums)

	/* 遍历数组 */
	traverse(nums)

	/* 查找元素 */
	index := find(nums, 3)
	fmt.Println("在 nums 中查找元素 3 ，得到索引 =", index)
}
