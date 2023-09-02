// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* Driver Code */
func TestList(t *testing.T) {
	/* 初始化列表 */
	list := []int{1, 3, 2, 5, 4}
	fmt.Println("列表 list =", list)

	/* 访问元素 */
	num := list[1] // 访问索引 1 处的元素
	fmt.Println("访问索引 1 处的元素，得到 num =", num)

	/* 更新元素 */
	list[1] = 0 // 将索引 1 处的元素更新为 0
	fmt.Println("将索引 1 处的元素更新为 0 ，得到 list =", list)

	/* 清空列表 */
	list = nil
	fmt.Println("清空列表后 list =", list)

	/* 尾部添加元素 */
	list = append(list, 1)
	list = append(list, 3)
	list = append(list, 2)
	list = append(list, 5)
	list = append(list, 4)
	fmt.Println("添加元素后 list =", list)

	/* 中间插入元素 */
	list = append(list[:3], append([]int{6}, list[3:]...)...) // 在索引 3 处插入数字 6
	fmt.Println("在索引 3 处插入数字 6 ，得到 list =", list)

	/* 删除元素 */
	list = append(list[:3], list[4:]...) // 删除索引 3 处的元素
	fmt.Println("删除索引 3 处的元素，得到 list =", list)

	/* 通过索引遍历列表 */
	count := 0
	for i := 0; i < len(list); i++ {
		count++
	}

	/* 直接遍历列表元素 */
	count = 0
	for range list {
		count++
	}

	/* 拼接两个列表 */
	list1 := []int{6, 8, 7, 10, 9}
	list = append(list, list1...) // 将列表 list1 拼接到 list 之后
	fmt.Println("将列表 list1 拼接到 list 之后，得到 list =", list)

	/* 排序列表 */
	sort.Ints(list) // 排序后，列表元素从小到大排列
	fmt.Println("排序列表后 list =", list)
}
