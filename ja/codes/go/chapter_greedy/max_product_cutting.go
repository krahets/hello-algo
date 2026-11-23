// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 分割後の積の最大化：貪欲法 */
func maxProductCutting(n int) int {
	// n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
	if n <= 3 {
		return 1 * (n - 1)
	}
	// 貪欲に 3 を切り出す。a は 3 の個数、b は余り
	a := n / 3
	b := n % 3
	if b == 1 {
		// 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// 余りが 2 の場合、何もしない
		return int(math.Pow(3, float64(a))) * 2
	}
	// 余りが 0 の場合、何もしない
	return int(math.Pow(3, float64(a)))
}
