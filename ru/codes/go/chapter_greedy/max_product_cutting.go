// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Максимальное произведение разрезания: жадный алгоритм */
func maxProductCutting(n int) int {
	// Когда n <= 3, обязательно нужно выделить одну 1
	if n <= 3 {
		return 1 * (n - 1)
	}
	// Жадно выделить множители 3, где a — число троек, а b — остаток
	a := n / 3
	b := n % 3
	if b == 1 {
		// Если остаток равен 1, преобразовать одну пару 1 * 3 в 2 * 2
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// Если остаток равен 2, ничего не делать
		return int(math.Pow(3, float64(a))) * 2
	}
	// Если остаток равен 0, ничего не делать
	return int(math.Pow(3, float64(a)))
}
