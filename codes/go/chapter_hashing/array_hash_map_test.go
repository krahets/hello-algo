// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* 初始化哈希表 */
	map1 := newArrayHashMap()

	/* 添加操作 */
	// 在哈希表中添加键值对 (key, value)
	map1.put(12836, "小哈")
	map1.put(15937, "小啰")
	map1.put(16750, "小算")
	map1.put(13276, "小法")
	map1.put(10583, "小鸭")
	fmt.Println("\n添加完成后，哈希表为\nKey -> Value")
	map1.print()

	/* 查询操作 */
	// 向哈希表输入键 key ，得到值 value
	name := map1.get(15937)
	fmt.Println("\n输入学号 15937 ，查询到姓名 " + name)

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	map1.remove(10583)
	fmt.Println("\n删除 10583 后，哈希表为\nKey -> Value")
	map1.print()

	/* 遍历哈希表 */
	fmt.Println("\n遍历键值对 Key->Value")
	for _, kv := range map1.entrySet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\n单独遍历键 Key")
	for _, key := range map1.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\n单独遍历值 Value")
	for _, val := range map1.valueSet() {
		fmt.Println(val)
	}
}
