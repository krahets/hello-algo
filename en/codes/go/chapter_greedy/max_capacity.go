// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Max capacity: Greedy algorithm */
func maxCapacity(ht []int) int {
	// Initialize i, j to be at both ends of the array
	i, j := 0, len(ht)-1
	// Initial max capacity is 0
	res := 0
	// Loop for greedy selection until the two boards meet
	for i < j {
		// Update max capacity
		capacity := int(math.Min(float64(ht[i]), float64(ht[j]))) * (j - i)
		res = int(math.Max(float64(res), float64(capacity)))
		// Move the shorter board inward
		if ht[i] < ht[j] {
			i++
		} else {
			j--
		}
	}
	return res
}
