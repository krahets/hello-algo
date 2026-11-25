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
	/* 해시 테이블 초기화 */
	hmap := make(map[int]string)

	/* 추가 */
	// 해시 테이블에 키-값 쌍 (key, value) 추가
	hmap[12836] = "샤오하"
	hmap[15937] = "샤오뤄"
	hmap[16750] = "샤오쑤안"
	hmap[13276] = "샤오파"
	hmap[10583] = "샤오야"
	fmt.Println("\n추가 후 해시 테이블\nKey -> Value")
	PrintMap(hmap)

	/* 조회 */
	// 해시 테이블에 키 key를 입력하여 값 value 조회
	name := hmap[15937]
	fmt.Println("\n학번 15937로 조회한 이름: ", name)

	/* 삭제 */
	// 해시 테이블에서 키-값 쌍 (key, value) 삭제
	delete(hmap, 10583)
	fmt.Println("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
	PrintMap(hmap)

	/* 해시 테이블 순회 */
	// 키-값 쌍 순회 key->value
	fmt.Println("\n키-값 쌍 순회 Key->Value")
	for key, value := range hmap {
		fmt.Println(key, "->", value)
	}
	// 키만 순회 key
	fmt.Println("\n키만 순회 Key")
	for key := range hmap {
		fmt.Println(key)
	}
	// 값만 순회 value
	fmt.Println("\n값만 순회 Value")
	for _, value := range hmap {
		fmt.Println(value)
	}
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
