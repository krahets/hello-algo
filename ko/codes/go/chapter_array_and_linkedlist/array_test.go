// File: array_test.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

/**
여기서는 Go의 슬라이스(Slice)를 배열(Array)로 취급한다. 이렇게 하면
개념을 쉽게 이해하고 자료 구조와 알고리즘에 집중할 수 있다.
*/

import (
	"fmt"
	"testing"
)

/* 실행 예제 */
func TestArray(t *testing.T) {
	/* 배열 초기화 */
	var arr [5]int
	fmt.Println("배열 arr =", arr)
	// Go에서 길이를 지정하면([5]int) 배열이고, 지정하지 않으면([]int) 슬라이스이다.
	// Go 배열의 길이는 컴파일 시점에 결정되므로 상수로만 길이를 지정할 수 있다.
	// 용량을 늘리는 extend() 함수를 쉽게 구현하기 위해 아래에서는 슬라이스(Slice)를 배열(Array)로 취급한다.
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("배열 nums =", nums)

	/* 임의 접근 */
	randomNum := randomAccess(nums)
	fmt.Println("nums에서 무작위로 선택한 원소:", randomNum)

	/* 길이 늘리기 */
	nums = extend(nums, 3)
	fmt.Println("길이를 8로 늘린 배열 nums =", nums)

	/* 원소 삽입 */
	insert(nums, 6, 3)
	fmt.Println("인덱스 3에 숫자 6을 삽입한 후 nums =", nums)

	/* 원소 삭제 */
	remove(nums, 2)
	fmt.Println("인덱스 2의 원소를 삭제한 후 nums =", nums)

	/* 배열 순회 */
	traverse(nums)

	/* 원소 찾기 */
	index := find(nums, 3)
	fmt.Println("nums에서 원소 3을 찾은 인덱스 =", index)
}
