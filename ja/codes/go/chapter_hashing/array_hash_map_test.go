// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* ハッシュテーブルを初期化する */
	hmap := newArrayHashMap()

	/* 追加操作 */
	// ハッシュテーブルにキーと値のペア (key, value) を追加する
	hmap.put(12836, "小哈")
	hmap.put(15937, "小啰")
	hmap.put(16750, "小算")
	hmap.put(13276, "小法")
	hmap.put(10583, "小鸭")
	fmt.Println("\n追加後のハッシュテーブル\nKey -> Value")
	hmap.print()

	/* 取得操作 */
	// ハッシュテーブルにキー key を渡し、値 value を取得する
	name := hmap.get(15937)
	fmt.Println("\n学生番号 15937 に対応する氏名は " + name)

	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除する
	hmap.remove(10583)
	fmt.Println("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
	hmap.print()

	/* ハッシュテーブルを走査する */
	fmt.Println("\nキーと値のペア Key->Value を走査する")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nキー Key だけを走査する")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\n値 Value だけを走査する")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
