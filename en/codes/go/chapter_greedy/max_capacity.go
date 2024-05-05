// File: max_capacity.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "math"

/* Maximum capacity: Greedy */
func maxCapacity(ht []int) int {
	// Initialize i, j, making them split the array at both ends
	i, j := 0, len(ht)-1
	// Initial maximum capacity is 0
	res := 0
	// Loop for greedy selection until the two boards meet
	for i < j {
		// Update maximum capacity
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
