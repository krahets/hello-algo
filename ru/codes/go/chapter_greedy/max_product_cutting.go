// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Максимальное произведение при разбиении: жадный алгоритм */
func maxProductCutting(n int) int {
	// При n <= 3 одно из слагаемых обязательно равно 1
	if n <= 3 {
		return 1 * (n - 1)
	}
	// Выделяем тройки жадно: a — число троек, b — остаток
	a := n / 3
	b := n % 3
	if b == 1 {
		// При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// При остатке 2 ничего не меняем
		return int(math.Pow(3, float64(a))) * 2
	}
	// При остатке 0 ничего не меняем
	return int(math.Pow(3, float64(a)))
}
