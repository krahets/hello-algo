// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 最大容量：貪婪 */
func maxCapacity(ht []int) int {
	// 初始化 i, j，使其分列陣列兩端
	i, j := 0, len(ht)-1
	// 初始最大容量為 0
	res := 0
	// 迴圈貪婪選擇，直至兩板相遇
	for i < j {
		// 更新最大容量
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// 向內移動短板
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
