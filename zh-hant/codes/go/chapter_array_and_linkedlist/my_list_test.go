// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* Driver Code */
func TestMyList(t *testing.T) {
	/* 初始化串列 */
	nums := newMyList()
	/* 在尾部新增元素 */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("串列 nums = %v ，容量 = %v ，長度 = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* 在中間插入元素 */
	nums.insert(6, 3)
	fmt.Printf("在索引 3 處插入數字 6 ，得到 nums = %v\n", nums.toArray())

	/* 刪除元素 */
	nums.remove(3)
	fmt.Printf("刪除索引 3 處的元素，得到 nums = %v\n", nums.toArray())

	/* 訪問元素 */
	num := nums.get(1)
	fmt.Printf("訪問索引 1 處的元素，得到 num = %v\n", num)

	/* 更新元素 */
	nums.set(0, 1)
	fmt.Printf("將索引 1 處的元素更新為 0 ，得到 nums = %v\n", nums.toArray())

	/* 測試擴容機制 */
	for i := 0; i < 10; i++ {
		// 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
		nums.add(i)
	}
	fmt.Printf("擴容後的串列 nums = %v ，容量 = %v ，長度 = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
