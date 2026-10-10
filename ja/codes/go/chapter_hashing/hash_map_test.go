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
	/* ハッシュテーブルを初期化 */
	hmap := make(map[int]string)

	/* 追加操作 */
	// ハッシュテーブルにキーと値のペア (key, value) を追加
	hmap[12836] = "シャオハー"
	hmap[15937] = "シャオルオ"
	hmap[16750] = "シャオスワン"
	hmap[13276] = "シャオファー"
	hmap[10583] = "シャオヤ"
	fmt.Println("\n追加後、ハッシュ表は\nKey -> Value")
	PrintMap(hmap)

	/* 検索操作 */
	// キー key をハッシュテーブルに渡し、値 value を取得
	name := hmap[15937]
	fmt.Println("\n学籍番号 15937 を入力し、見つかった名前は ", name)

	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除
	delete(hmap, 10583)
	fmt.Println("\n10583 を削除後、ハッシュ表は\nKey -> Value")
	PrintMap(hmap)

	/* ハッシュテーブルを走査 */
	// キーと値の組 key->value を走査する
	fmt.Println("\nキーと値の組 Key->Value を走査")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// キー key のみを走査する
	fmt.Println("\nキー Key を個別に走査")
	for key := range hmap {
		fmt.Println(key)
	}
	// 値 value のみを走査する
	fmt.Println("\n値 Value を個別に走査")
	for _, value := range hmap {
		fmt.Println(value)
	}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello アルゴリズム"

	hash = addHash(key)
	fmt.Println("加算ハッシュ値は " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("乗算ハッシュ値は " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("排他的論理和ハッシュ値は " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("回転ハッシュ値は " + strconv.Itoa(hash))
}
