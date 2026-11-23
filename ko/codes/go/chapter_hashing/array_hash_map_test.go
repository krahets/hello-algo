// File: array_hash_map_test.go
// Created Time: 2022-12-14
// Author: msk397 (machangxinq@gmail.com)

package chapter_hashing

import (
	"fmt"
	"testing"
)

func TestArrayHashMap(t *testing.T) {
	/* 해시 테이블 초기화 */
	hmap := newArrayHashMap()

	/* 추가 연산 */
	// 해시 테이블에 (key, value) 키-값 쌍을 추가한다
	hmap.put(12836, "小哈")
	hmap.put(15937, "小啰")
	hmap.put(16750, "小算")
	hmap.put(13276, "小法")
	hmap.put(10583, "小鸭")
	fmt.Println("\n추가를 마친 후의 해시 테이블\n키 -> 값")
	hmap.print()

	/* 조회 연산 */
	// 해시 테이블에 키 key를 입력하여 값 value를 얻는다
	name := hmap.get(15937)
	fmt.Println("\n학번 15937을 입력하여 조회한 이름 " + name)

	/* 삭제 연산 */
	// 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
	hmap.remove(10583)
	fmt.Println("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
	hmap.print()

	/* 해시 테이블 순회 */
	fmt.Println("\n키-값 쌍(키->값) 순회")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\n키 Key만 순회")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\n값 Value만 순회")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
