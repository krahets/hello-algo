// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* 임의의 원소에 접근 */
func randomAccess(nums []int) (randomNum int) {
	// 구간 [0, nums.length)에서 수 하나를 무작위로 선택
	randomIndex := rand.Intn(len(nums))
	// 선택한 원소를 가져와 반환
	randomNum = nums[randomIndex]
	return
}

/* 배열 길이 늘리기 */
func extend(nums []int, enlarge int) []int {
	// 길이를 늘린 새 배열 초기화
	res := make([]int, len(nums)+enlarge)
	// 원래 배열의 모든 원소를 새 배열에 복사
	for i, num := range nums {
		res[i] = num
	}
	// 길이를 늘린 새 배열 반환
	return res
}

/* 배열의 인덱스 index에 원소 num 삽입 */
func insert(nums []int, num int, index int) {
	// 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// 인덱스 index의 원소에 num 대입
	nums[index] = num
}

/* 인덱스 index의 원소 삭제 */
func remove(nums []int, index int) {
	// 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* 배열 순회 */
func traverse(nums []int) {
	count := 0
	// 인덱스로 배열 순회
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// 배열 원소를 직접 순회
	for _, num := range nums {
		count += num
	}
	// 인덱스와 원소를 함께 순회
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* 배열에서 지정한 원소 찾기 */
func find(nums []int, target int) (index int) {
	index = -1
	for i := 0; i < len(nums); i++ {
		if nums[i] == target {
			index = i
			break
		}
	}
	return
}
