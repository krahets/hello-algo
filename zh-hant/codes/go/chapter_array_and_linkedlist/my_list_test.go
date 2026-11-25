// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* 範例主程式 */
func TestMyList(t *testing.T) {
	/* 初始化列表 */
	nums := newMyList()
	/* 在尾端加入元素 */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("列表 nums = %v，容量 = %v，長度 = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* 在中間插入元素 */
	nums.insert(6, 3)
	fmt.Printf("在索引 3 處插入數字 6，得到 nums = %v\n", nums.toArray())

	/* 刪除元素 */
	nums.remove(3)
	fmt.Printf("刪除索引 3 處的元素，得到 nums = %v\n", nums.toArray())

	/* 存取元素 */
	num := nums.get(1)
	fmt.Printf("存取索引 1 處的元素，得到 num = %v\n", num)

	/* 更新元素 */
	nums.set(0, 1)
	fmt.Printf("將索引 1 處的元素更新為 0，得到 nums = %v\n", nums.toArray())

	/* 測試容量擴充機制 */
	for i := 0; i < 10; i++ {
		// 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
		nums.add(i)
	}
	fmt.Printf("擴充後的列表 nums = %v，容量 = %v，長度 = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
