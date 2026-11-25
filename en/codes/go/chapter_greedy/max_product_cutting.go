// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Greedy maximum product algorithm */
func maxProductCutting(n int) int {
	// When n <= 3, one piece must be 1
	if n <= 3 {
		return 1 * (n - 1)
	}
	// Greedily cut off pieces of size 3. Let a be their count and b the remainder
	a := n / 3
	b := n % 3
	if b == 1 {
		// If the remainder is 1, replace one pair 1 * 3 with 2 * 2
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// If the remainder is 2, leave it as is
		return int(math.Pow(3, float64(a))) * 2
	}
	// If the remainder is 0, no adjustment is needed
	return int(math.Pow(3, float64(a)))
}
