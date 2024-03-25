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
	/* 初始化雜湊表 */
	hmap := make(map[int]string)

	/* 新增操作 */
	// 在雜湊表中新增鍵值對 (key, value)
	hmap[12836] = "小哈"
	hmap[15937] = "小囉"
	hmap[16750] = "小算"
	hmap[13276] = "小法"
	hmap[10583] = "小鴨"
	fmt.Println("\n新增完成後，雜湊表為\nKey -> Value")
	PrintMap(hmap)

	/* 查詢操作 */
	// 向雜湊表中輸入鍵 key ，得到值 value
	name := hmap[15937]
	fmt.Println("\n輸入學號 15937 ，查詢到姓名 ", name)

	/* 刪除操作 */
	// 在雜湊表中刪除鍵值對 (key, value)
	delete(hmap, 10583)
	fmt.Println("\n刪除 10583 後，雜湊表為\nKey -> Value")
	PrintMap(hmap)

	/* 走訪雜湊表 */
	// 走訪鍵值對 key->value
	fmt.Println("\n走訪鍵值對 Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// 單獨走訪鍵 key
	fmt.Println("\n單獨走訪鍵 Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// 單獨走訪值 value
	fmt.Println("\n單獨走訪值 Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello 演算法"

	hash = addHash(key)
	fmt.Println("加法雜湊值為 " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("乘法雜湊值為 " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("互斥或雜湊值為 " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("旋轉雜湊值為 " + strconv.Itoa(hash))
}
