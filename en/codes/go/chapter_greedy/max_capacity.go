// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Maximum container capacity: greedy algorithm */
func maxCapacity(ht []int) int {
	// Initialize i and j at opposite ends of the array
	i, j := 0, len(ht)-1
	// The initial maximum capacity is 0
	res := 0
	// Repeatedly make greedy choices until the two sides meet
	for i < j {
		// Update the maximum capacity
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// Move the shorter side inward
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
