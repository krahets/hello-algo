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

	/* 추가 */
	// 해시 테이블에 키-값 쌍 (key, value) 추가
	hmap.put(12836, "샤오하")
	hmap.put(15937, "샤오뤄")
	hmap.put(16750, "샤오쑤안")
	hmap.put(13276, "샤오파")
	hmap.put(10583, "샤오야")
	fmt.Println("\n추가 후 해시 테이블\nKey -> Value")
	hmap.print()

	/* 조회 */
	// 해시 테이블에 키 key를 입력하여 값 value 조회
	name := hmap.get(15937)
	fmt.Println("\n학번 15937로 조회한 이름: " + name)

	/* 삭제 */
	// 해시 테이블에서 키-값 쌍 (key, value) 삭제
	hmap.remove(10583)
	fmt.Println("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
	hmap.print()

	/* 해시 테이블 순회 */
	fmt.Println("\n키-값 쌍 순회 Key->Value")
	for _, kv := range hmap.pairSet() {
		fmt.Println(kv.key, " -> ", kv.val)
	}

	fmt.Println("\n키만 순회 Key")
	for _, key := range hmap.keySet() {
		fmt.Println(key)
	}

	fmt.Println("\n값만 순회 Value")
	for _, val := range hmap.valueSet() {
		fmt.Println(val)
	}
}
