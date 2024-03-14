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
	/* 初始化列表 */
	nums := newMyList()
	/* 在尾部添加元素 */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("列表 nums = %v ，容量 = %v ，长度 = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* 在中间插入元素 */
	nums.insert(6, 3)
	fmt.Printf("在索引 3 处插入数字 6 ，得到 nums = %v\n", nums.toArray())

	/* 删除元素 */
	nums.remove(3)
	fmt.Printf("删除索引 3 处的元素，得到 nums = %v\n", nums.toArray())

	/* 访问元素 */
	num := nums.get(1)
	fmt.Printf("访问索引 1 处的元素，得到 num = %v\n", num)

	/* 更新元素 */
	nums.set(0, 1)
	fmt.Printf("将索引 1 处的元素更新为 0 ，得到 nums = %v\n", nums.toArray())

	/* 测试扩容机制 */
	for i := 0; i < 10; i++ {
		// 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
		nums.add(i)
	}
	fmt.Printf("扩容后的列表 nums = %v ，容量 = %v ，长度 = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
