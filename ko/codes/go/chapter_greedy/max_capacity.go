// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 탐욕 알고리즘으로 최대 용량 구하기 */
func maxCapacity(ht []int) int {
	// i와 j를 각각 배열의 양 끝에 놓는다
	i, j := 0, len(ht)-1
	// 최대 용량의 초깃값은 0이다
	res := 0
	// 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
	for i < j {
		// 최대 용량을 갱신한다
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
