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
	// [region]{init_hash_map}
	/* ハッシュテーブルを初期化する */
	hmap := make(map[int]string)
	// [endregion]{init_hash_map}

	// [region]{add_pairs}
	/* 追加操作 */
	// ハッシュテーブルにキーと値のペア (key, value) を追加する
	hmap[12836] = "小哈"
	hmap[15937] = "小啰"
	hmap[16750] = "小算"
	hmap[13276] = "小法"
	hmap[10583] = "小鸭"
	// [endregion]{add_pairs}
	fmt.Println("\n追加後のハッシュテーブル\nKey -> Value")
	PrintMap(hmap)

	// [region]{get_value}
	/* 取得操作 */
	// ハッシュテーブルにキー key を渡し、値 value を取得する
	name := hmap[15937]
	// [endregion]{get_value}
	fmt.Println("\n学生番号 15937 に対応する氏名は ", name)

	// [region]{remove_pair}
	/* 削除操作 */
	// ハッシュテーブルからキーと値のペア (key, value) を削除する
	delete(hmap, 10583)
	// [endregion]{remove_pair}
	fmt.Println("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
	PrintMap(hmap)

	fmt.Println("\nキーと値のペア Key->Value を走査する")
	// [region]{iterate_pairs}
	/* ハッシュテーブルを走査する */
	// キーと値のペア key->value を走査する
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// [endregion]{iterate_pairs}

	fmt.Println("\nキー Key だけを走査する")
	// [region]{iterate_keys}
	// キー key だけを走査する
	for key := range hmap {
		fmt.Println(key)
	}
	// [endregion]{iterate_keys}

	fmt.Println("\n値 Value だけを走査する")
	// [region]{iterate_values}
	// 値 value だけを走査する
	for _, value := range hmap {
		fmt.Println(value)
	}
	// [endregion]{iterate_values}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello 算法"

	hash = addHash(key)
	fmt.Println("加算ハッシュの値は " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("乗算ハッシュの値は " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("排他的論理和ハッシュの値は " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("回転ハッシュの値は " + strconv.Itoa(hash))
}
