// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 최대 용량: 탐욕 */
func maxCapacity(ht []int) int {
	// i와 j가 각각 배열의 양 끝을 가리키도록 초기화한다
	i, j := 0, len(ht)-1
	// 최대 용량의 초깃값은 0이다
	res := 0
	// 두 칸막이가 만날 때까지 탐욕적 선택을 반복한다
	for i < j {
		// 최대 용량을 갱신한다
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// 낮은 칸막이를 안쪽으로 이동한다
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
