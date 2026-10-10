// File: max_product_cutting.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Max product cutting: Greedy algorithm */
func maxProductCutting(n int) int {
	// When n <= 3, must cut out a 1
	if n <= 3 {
		return 1 * (n - 1)
	}
	// Greedily cut out 3, a is the number of 3s, b is the remainder
	a := n / 3
	b := n % 3
	if b == 1 {
		// When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
		return int(math.Pow(3, float64(a-1))) * 2 * 2
	}
	if b == 2 {
		// When the remainder is 2, do nothing
		return int(math.Pow(3, float64(a))) * 2
	}
	// When the remainder is 0, do nothing
	return int(math.Pow(3, float64(a)))
}
