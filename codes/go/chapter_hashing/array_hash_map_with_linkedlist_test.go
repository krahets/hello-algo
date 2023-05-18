// File: array_hash_map_with_linkedlist.go
// Created Time: 2023-05-18
// Author: msk397 (icbigdata@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func Test_newArrayHashMapWithLinkedList(t *testing.T) {
	/* 初始化哈希表 */
	mapp := newArrayHashMapWithLinkedList(100)

	/* 添加操作 */
	// 在哈希表中添加键值对 (key, value)
	mapp.put(12836, "小哈")
	mapp.put(15937, "小啰")
	mapp.put(16750, "小算")
	mapp.put(13276, "小法")
	mapp.put(10583, "小鸭")

	// 构hash key冲突
	mapp.put(20583, "小鸭2")
	mapp.put(30583, "小鸭3")
	mapp.put(40583, "小鸭4")

	fmt.Println("\n添加完成后，哈希表为\nKey -> Value")
	mapp.print()

	/* 更新key的val */
	mapp.put(10583, "小鸭1")
	fmt.Println("\n更新学号 10583 ，姓名为 小鸭1")
	mapp.print()
	/* 查询操作 */
	// 向哈希表输入键 key ，得到值 value
	name := mapp.get(15937)
	fmt.Println("\n输入学号 15937 ，查询到姓名 " + name)

	/* 查询操作 */
	// 向哈希表输入键 key ，得到值 value
	name = mapp.get(20583)
	fmt.Println("\n输入学号 20583 ，查询到姓名 " + name)

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	mapp.remove(12836)
	fmt.Println("\n删除 12836 后，哈希表为\nKey -> Value")
	mapp.print()

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	mapp.remove(10583)
	fmt.Println("\n删除 10583 后，哈希表为\nKey -> Value")
	mapp.print()

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	mapp.remove(30583)
	fmt.Println("\n删除 30583 后，哈希表为\nKey -> Value")
	mapp.print()

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	mapp.remove(40583)
	fmt.Println("\n删除 40583 后，哈希表为\nKey -> Value")
	mapp.print()

	/* 遍历哈希表 */
	fmt.Println("\n遍历键值对 Key->Value")
	for _, kv := range mapp.entrySet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\n单独遍历键 Key")
	for _, key := range mapp.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\n单独遍历值 Value")
	for _, val := range mapp.valueSet() {
		fmt.Println(val)
	}
}
