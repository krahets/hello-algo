// File: hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashmap(t *testing.T) {
	// 初始化哈希表
	Map := make(map[int]string)

	// 添加操作
	// 在哈希表中添加键值对 (key, value)
	Map[12836] = "小哈"
	Map[15937] = "小啰"
	Map[16750] = "小算"
	Map[13276] = "小法"
	Map[10583] = "小鸭"
	fmt.Println("\n添加完成后，哈希表为\nKey -> Value")
	for key, value := range Map {
		fmt.Printf("%d -> %s\n", key, value)
	}

	// 查询操作
	// 向哈希表输入键 key ，得到值 value
	name := Map[15937]
	fmt.Println("\n输入学号 15937 ，查询到姓名 ", name)

	// 删除操作
	// 在哈希表中删除键值对 (key, value)
	delete(Map, 10583)
	fmt.Println("\n删除 10583 后，哈希表为\nKey -> Value")
	for key, value := range Map {
		fmt.Printf("%d -> %s\n", key, value)
	}

	/* 遍历哈希表 */
	// 遍历键值对 key->value
	fmt.Println("\n遍历键值对 Key->Value")
	for key, value := range Map {
		fmt.Println(key, "->", value)
	}
	// 单独遍历键 key
	fmt.Println("\n单独遍历键 Key")
	for key := range Map {
		fmt.Println(key)
	}
	// 单独遍历值 value
	fmt.Println("\n单独遍历值 Value")
	for _, value := range Map {
		fmt.Println(value)
	}
}
