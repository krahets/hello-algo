// File: hash_collision_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestHashMapChaining(t *testing.T) {
	/* ハッシュテーブルを初期化 */
	hmap := newHashMapChaining()

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
	fmt.Println("\n学籍番号 15937 を入力し、見つかった名前は", name)

	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除
	hmap.remove(12836)
	fmt.Println("\n12836 を削除後、ハッシュ表は\nKey -> Value")
	hmap.print()
}

func TestHashMapOpenAddressing(t *testing.T) {
	/* ハッシュテーブルを初期化 */
	hmap := newHashMapOpenAddressing()

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
	name := hmap.get(13276)
	fmt.Println("\n学籍番号 13276 を入力し、見つかった名前は ", name)

	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除
	hmap.remove(16750)
	fmt.Println("\n16750 を削除後、ハッシュ表は\nKey -> Value")
	hmap.print()
}
