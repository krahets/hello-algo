// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 最大容量：貪欲法 */
func maxCapacity(ht []int) int {
	// i, j を初期化し、それぞれ配列の両端に置く
	i, j := 0, len(ht)-1
	// 初期の最大容量は 0
	res := 0
	// 2 枚の板が出会うまで貪欲選択を繰り返す
	for i < j {
		// 最大容量を更新する
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// 短い方を内側へ動かす
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
