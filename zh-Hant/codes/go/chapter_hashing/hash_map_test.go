// File: hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"strconv"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestHashMap(t *testing.T) {
	/* 初始化哈希表 */
	hmap := make(map[int]string)

	/* 添加操作 */
	// 在哈希表中添加键值对 (key, value)
	hmap[12836] = "小哈"
	hmap[15937] = "小啰"
	hmap[16750] = "小算"
	hmap[13276] = "小法"
	hmap[10583] = "小鸭"
	fmt.Println("\n添加完成后，哈希表为\nKey -> Value")
	PrintMap(hmap)

	/* 查询操作 */
	// 向哈希表中输入键 key ，得到值 value
	name := hmap[15937]
	fmt.Println("\n输入学号 15937 ，查询到姓名 ", name)

	/* 删除操作 */
	// 在哈希表中删除键值对 (key, value)
	delete(hmap, 10583)
	fmt.Println("\n删除 10583 后，哈希表为\nKey -> Value")
	PrintMap(hmap)

	/* 遍历哈希表 */
	// 遍历键值对 key->value
	fmt.Println("\n遍历键值对 Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// 单独遍历键 key
	fmt.Println("\n单独遍历键 Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// 单独遍历值 value
	fmt.Println("\n单独遍历值 Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello 算法"

	hash = addHash(key)
	fmt.Println("加法哈希值为 " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("乘法哈希值为 " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("异或哈希值为 " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("旋转哈希值为 " + strconv.Itoa(hash))
}
