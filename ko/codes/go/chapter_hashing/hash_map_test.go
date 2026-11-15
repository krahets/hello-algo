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
	/* 해시 테이블 초기화 */
	hmap := make(map[int]string)
	// [endregion]{init_hash_map}

	// [region]{add_pairs}
	/* 추가 연산 */
	// 해시 테이블에 (key, value) 키-값 쌍을 추가한다
	hmap[12836] = "小哈"
	hmap[15937] = "小啰"
	hmap[16750] = "小算"
	hmap[13276] = "小法"
	hmap[10583] = "小鸭"
	// [endregion]{add_pairs}
	fmt.Println("\n추가를 마친 후의 해시 테이블\n키 -> 값")
	PrintMap(hmap)

	// [region]{get_value}
	/* 조회 연산 */
	// 해시 테이블에 키 key를 입력하여 값 value를 얻는다
	name := hmap[15937]
	// [endregion]{get_value}
	fmt.Println("\n학번 15937을 입력하여 조회한 이름 ", name)

	// [region]{remove_pair}
	/* 삭제 연산 */
	// 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
	delete(hmap, 10583)
	// [endregion]{remove_pair}
	fmt.Println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
	PrintMap(hmap)

	fmt.Println("\n키-값 쌍(키->값) 순회")
	// [region]{iterate_pairs}
	/* 해시 테이블 순회 */
	// 키-값 쌍 key->value를 순회한다
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// [endregion]{iterate_pairs}

	fmt.Println("\n키 Key만 순회")
	// [region]{iterate_keys}
	// 키 key만 순회한다
	for key := range hmap {
		fmt.Println(key)
	}
	// [endregion]{iterate_keys}

	fmt.Println("\n값 Value만 순회")
	// [region]{iterate_values}
	// 값 value만 순회한다
	for _, value := range hmap {
		fmt.Println(value)
	}
	// [endregion]{iterate_values}
}

func TestSimpleHash(t *testing.T) {
	var hash int

	key := "Hello 算法"

	hash = addHash(key)
	fmt.Println("덧셈 해시값: " + strconv.Itoa(hash))

	hash = mulHash(key)
	fmt.Println("곱셈 해시값: " + strconv.Itoa(hash))

	hash = xorHash(key)
	fmt.Println("XOR 해시값: " + strconv.Itoa(hash))

	hash = rotHash(key)
	fmt.Println("회전 해시값: " + strconv.Itoa(hash))
}
