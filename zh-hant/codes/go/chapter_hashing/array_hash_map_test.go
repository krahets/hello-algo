// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* 初始化雜湊表 */
	hmap := newArrayHashMap()

	/* 新增操作 */
	// 在雜湊表中新增鍵值對 (key, value)
	hmap.put(12836, "小哈")
	hmap.put(15937, "小囉")
	hmap.put(16750, "小算")
	hmap.put(13276, "小法")
	hmap.put(10583, "小鴨")
	fmt.Println("\n新增後的雜湊表\nKey -> Value")
	hmap.print()

	/* 查詢操作 */
	// 輸入鍵 key，從雜湊表取得對應的值 value
	name := hmap.get(15937)
	fmt.Println("\n輸入學號 15937，查得姓名 " + name)

	/* 刪除操作 */
	// 從雜湊表刪除鍵值對 (key, value)
	hmap.remove(10583)
	fmt.Println("\n刪除 10583 後的雜湊表\nKey -> Value")
	hmap.print()

	/* 走訪雜湊表 */
	fmt.Println("\n走訪鍵值對 Key->Value")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\n只走訪鍵 Key")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\n只走訪值 Value")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
