// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* 初始化哈希表 */
	hmap := newHashMapChaining()

	/* 添加操作 */
	// 在哈希表中添加键值对 (key, value)
	hmap.put(12836, "小哈")
	hmap.put(15937, "小啰")
	hmap.put(16750, "小算")
	hmap.put(13276, "小法")
	hmap.put(10583, "小鸭")
	fmt.Println("\n添加完成后，哈希表为\nKey -> Value")
	hmap.print()

	/* 查询操作 */
	// 向哈希表中输入键 key ，得到值 value
	name := hmap.get(15937)
	fmt.Println("\n输入学号 15937 ，查询到姓名", name)

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	hmap.remove(12836)
	fmt.Println("\n删除 12836 后，哈希表为\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* 初始化哈希表 */
	hmap := newHashMapOpenAddressing()

	/* 添加操作 */
	// 在哈希表中添加键值对 (key, value)
	hmap.put(12836, "小哈")
	hmap.put(15937, "小啰")
	hmap.put(16750, "小算")
	hmap.put(13276, "小法")
	hmap.put(10583, "小鸭")
	fmt.Println("\n添加完成后，哈希表为\nKey -> Value")
	hmap.print()

	/* 查询操作 */
	// 向哈希表中输入键 key ，得到值 value
	name := hmap.get(13276)
	fmt.Println("\n输入学号 13276 ，查询到姓名 ", name)

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	hmap.remove(16750)
	fmt.Println("\n删除 16750 后，哈希表为\nKey -> Value")
	hmap.print()
}
