// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* ハッシュテーブルを初期化する */
	hmap := newHashMapChaining()

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
	fmt.Println("\n学生番号 15937 に対応する氏名は", name)

	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除する
	hmap.remove(12836)
	fmt.Println("\n12836 を削除した後のハッシュテーブル\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* ハッシュテーブルを初期化する */
	hmap := newHashMapOpenAddressing()

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
	name := hmap.get(13276)
	fmt.Println("\n学生番号 13276 に対応する氏名は ", name)

	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除する
	hmap.remove(16750)
	fmt.Println("\n16750 を削除した後のハッシュテーブル\nKey -> Value")
	hmap.print()
}
