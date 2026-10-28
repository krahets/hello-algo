// File: array.go
// Created Time: 2022-12-29
// Author: GuoWei (gongguowei01@gmail.com), cathay (cathaycchen@gmail.com)

package chapter_array_and_linkedlist

import (
	"math/rand"
)

/* 원소에 임의 접근 */
func randomAccess(nums []int) (randomNum int) {
	// 구간 [0, nums.length)에서 숫자 하나를 무작위로 뽑는다
	randomIndex := rand.Intn(len(nums))
	// 무작위 원소를 가져와 반환한다
	randomNum = nums[randomIndex]
	return
}

/* 배열 길이 확장 */
func extend(nums []int, enlarge int) []int {
	// 길이를 확장한 배열을 초기화한다
	res := make([]int, len(nums)+enlarge)
	// 원래 배열의 모든 원소를 새 배열에 복사한다
	for i, num := range nums {
		res[i] = num
	}
	// 확장한 새 배열을 반환한다
	return res
}

/* 배열의 인덱스 index에 원소 num 삽입 */
func insert(nums []int, num int, index int) {
	// 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
	for i := len(nums) - 1; i > index; i-- {
		nums[i] = nums[i-1]
	}
	// index 위치의 원소에 num을 대입한다
	nums[index] = num
}

/* 인덱스 index에 있는 원소 삭제 */
func remove(nums []int, index int) {
	// 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
	for i := index; i < len(nums)-1; i++ {
		nums[i] = nums[i+1]
	}
}

/* 배열 순회 */
func traverse(nums []int) {
	count := 0
	// 인덱스를 통해 배열을 순회한다
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}
	count = 0
	// 배열의 원소를 직접 순회한다
	for _, num := range nums {
		count += num
	}
	// 데이터의 인덱스와 원소를 함께 순회한다
	for i, num := range nums {
		count += nums[i]
		count += num
	}
}

/* 배열에서 지정한 원소 탐색 */
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
