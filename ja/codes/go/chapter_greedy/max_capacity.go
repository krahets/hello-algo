// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 最大容量（貪欲法） */
func maxCapacity(ht []int) int {
	// i と j を配列の両端に置く
	i, j := 0, len(ht)-1
	// 最大容量の初期値は 0
	res := 0
	// 両方の板が同じ位置に来るまで貪欲選択を繰り返す
	for i < j {
		// 最大容量を更新する
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// 低い板のポインタを内側へ動かす
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
