// File: my_list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"testing"
)

/* 실행 코드 */
func TestMyList(t *testing.T) {
	/* 리스트 초기화 */
	nums := newMyList()
	/* 맨 뒤에 원소 추가 */
	nums.add(1)
	nums.add(3)
	nums.add(2)
	nums.add(5)
	nums.add(4)
	fmt.Printf("리스트 nums = %v, 용량 = %v, 길이 = %v\n", nums.toArray(), nums.capacity(), nums.size())

	/* 중간에 원소 삽입 */
	nums.insert(6, 3)
	fmt.Printf("인덱스 3에 숫자 6을 삽입한 후 nums = %v\n", nums.toArray())

	/* 원소 삭제 */
	nums.remove(3)
	fmt.Printf("인덱스 3의 원소를 삭제한 후 nums = %v\n", nums.toArray())

	/* 원소 접근 */
	num := nums.get(1)
	fmt.Printf("인덱스 1의 원소에 접근하여 얻은 num = %v\n", num)

	/* 원소 갱신 */
	nums.set(0, 1)
	fmt.Printf("인덱스 1의 원소를 0으로 갱신한 후 nums = %v\n", nums.toArray())

	/* 용량 확장 동작 테스트 */
	for i := 0; i < 10; i++ {
		// i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
		nums.add(i)
	}
	fmt.Printf("용량을 늘린 후 리스트 nums = %v, 용량 = %v, 길이 = %v\n", nums.toArray(), nums.capacity(), nums.size())
}
