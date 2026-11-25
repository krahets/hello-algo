// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 整数分割の最大積（貪欲法） */
func maxProductCutting(n int) int {
	// n <= 3 の場合は必ず 1 を切り出す
	if n <= 3 {
		return 1 * (n - 1)
	}
	// 貪欲に 3 を切り出す。a は 3 の個数、b は余り
	a := n / 3
	b := n % 3
	if b == 1 {
		// 余りが 1 なら、1 * 3 の組を 2 * 2 に置き換える
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// 余りが 2 なら、そのままにする
		return int(math.Pow(3, float64(a))) * 2
	}
	// 余りが 0 なら、そのままにする
	return int(math.Pow(3, float64(a)))
}
