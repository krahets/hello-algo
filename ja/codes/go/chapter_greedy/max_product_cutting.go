// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 最大切断積：貪欲法 */
func maxProductCutting(n int) int {
	// n <= 3 のときは、必ず 1 を切り出す
	if n <= 3 {
		return 1 * (n - 1)
	}
	// 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
	a := n / 3
	b := n % 3
	if b == 1 {
		// 余りが 1 のときは、1 * 3 を 2 * 2 に変える
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// 余りが 2 のときは、そのままにする
		return int(math.Pow(3, float64(a))) * 2
	}
	// 余りが 0 のときは、そのままにする
	return int(math.Pow(3, float64(a)))
}
