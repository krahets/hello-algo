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
	/* ハッシュ表を初期化する */
	hmap := make(map[int]string)

	/* 追加 */
	// ハッシュ表にペア (key, value) を追加する
	hmap[12836] = "小哈"
	hmap[15937] = "小啰"
	hmap[16750] = "小算"
	hmap[13276] = "小法"
	hmap[10583] = "小鸭"
	fmt.Println("\n追加後のハッシュ表\nKey -> Value")
	PrintMap(hmap)

	/* 検索 */
	// ハッシュ表でキー key に対応する値 value を取得する
	name := hmap[15937]
	fmt.Println("\n学籍番号 15937 に対応する名前は ", name)

	/* 削除 */
	// ハッシュ表からペア (key, value) を削除する
	delete(hmap, 10583)
	fmt.Println("\n10583 を削除した後のハッシュ表\nKey -> Value")
	PrintMap(hmap)

	/* ハッシュ表を走査する */
	// キーと値のペアを順に表示 key->value
	fmt.Println("\nキーと値のペアを順に表示 Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// キーだけを順に表示 key
	fmt.Println("\nキーだけを順に表示 Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// 値だけを順に表示 value
	fmt.Println("\n値だけを順に表示 Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello 算法"

	hash = addHash(key)
	fmt.Println("加算ハッシュの値は " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("乗算ハッシュの値は " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("XOR ハッシュの値は " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("回転ハッシュの値は " + strconv.Itoa(hash))
}
