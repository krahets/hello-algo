// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 最大容量：貪婪法 */
func maxCapacity(ht []int) int {
	// 將 i、j 分別設在陣列的兩端
	i, j := 0, len(ht)-1
	// 起始最大容量為 0
	res := 0
	// 反覆執行貪婪選擇，直到兩塊隔板相遇
	for i < j {
		// 更新最大容量
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// 將較矮隔板的指標往內移
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
