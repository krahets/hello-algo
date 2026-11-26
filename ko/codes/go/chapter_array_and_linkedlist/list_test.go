// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* 실행 예제 */
func TestList(t *testing.T) {
	/* 리스트 초기화 */
	nums := []int{1, 3, 2, 5, 4}
	fmt.Println("리스트 nums =", nums)

	/* 원소 접근 */
	num := nums[1] // 인덱스 1의 원소에 접근
	fmt.Println("인덱스 1의 원소를 읽은 결과 num =", num)

	/* 원소 갱신 */
	nums[1] = 0 // 인덱스 1의 원소를 0으로 갱신
	fmt.Println("인덱스 1의 원소를 0으로 바꾼 후 nums =", nums)

	/* 리스트 비우기 */
	nums = nil
	fmt.Println("리스트를 비운 후 nums =", nums)

	/* 맨 뒤에 원소 추가 */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	fmt.Println("원소 추가 후 nums =", nums)

	/* 중간에 원소 삽입 */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 인덱스 3에 숫자 6 삽입
	fmt.Println("인덱스 3에 숫자 6을 삽입한 후 nums =", nums)

	/* 원소 삭제 */
	nums = append(nums[:3], nums[4:]...) // 인덱스 3의 원소 삭제
	fmt.Println("인덱스 3의 원소를 삭제한 후 nums =", nums)

	/* 인덱스로 리스트 순회 */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	/* 리스트 원소를 직접 순회 */
	count = 0
	for _, x := range nums {
		count += x
	}

	/* 두 리스트 이어 붙이기 */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // nums 뒤에 리스트 nums1 이어 붙이기
	fmt.Println("nums 뒤에 리스트 nums1을 이어 붙인 후 nums =", nums)

	/* 리스트 정렬 */
	sort.Ints(nums) // 정렬 후 리스트 원소는 오름차순으로 배열된다.
	fmt.Println("리스트 정렬 후 nums =", nums)
}
