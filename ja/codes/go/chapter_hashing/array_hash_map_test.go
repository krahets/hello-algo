// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* ハッシュテーブルを初期化 */
	hmap := newArrayHashMap()

	/* 追加操作 */
	// ハッシュテーブルにキーと値のペア (key, value) を追加
	hmap.put(12836, "シャオハー")
	hmap.put(15937, "シャオルオ")
	hmap.put(16750, "シャオスワン")
	hmap.put(13276, "シャオファー")
	hmap.put(10583, "シャオヤ")
	fmt.Println("\n追加後、ハッシュ表は\nKey -> Value")
	hmap.print()

	/* 検索操作 */
	// キー key をハッシュテーブルに渡し、値 value を取得
	name := hmap.get(15937)
	fmt.Println("\n学籍番号 15937 を入力し、見つかった名前は " + name)

	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除
	hmap.remove(10583)
	fmt.Println("\n10583 を削除後、ハッシュ表は\nKey -> Value")
	hmap.print()

	/* ハッシュテーブルを走査 */
	fmt.Println("\nキーと値の組 Key->Value を走査")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\nキー Key を個別に走査")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\n値 Value を個別に走査")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
