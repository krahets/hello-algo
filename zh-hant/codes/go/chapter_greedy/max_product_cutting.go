// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* 最大切分乘積：貪婪法 */
func maxProductCutting(n int) int {
	// 當 n <= 3 時，必須切出一個 1
	if n <= 3 {
		return 1 * (n - 1)
	}
	// 依貪婪策略盡量切出 3，a 為 3 的個數，b 為餘數
	a := n / 3
	b := n % 3
	if b == 1 {
		// 若餘數為 1，將一組 1 * 3 改為 2 * 2
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// 若餘數為 2，無須調整
		return int(math.Pow(3, float64(a))) * 2
	}
	// 若餘數為 0，無須調整
	return int(math.Pow(3, float64(a)))
}
