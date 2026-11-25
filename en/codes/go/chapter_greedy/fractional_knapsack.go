// File: fractional_knapsack.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

import "sort"

/* Item */
type Item struct {
	w int // Item weight
	v int // Item value
}

/* Greedy fractional knapsack */
func fractionalKnapsack(wgt []int, val []int, cap int) float64 {
	// Create a list of items, each with a weight and a value
	items := make([]Item, len(wgt))
	for i := 0; i < len(wgt); i++ {
		items[i] = Item{wgt[i], val[i]}
	}
	// Sort by value per unit of weight, item.v / item.w, in descending order
	sort.Slice(items, func(i, j int) bool {
		return float64(items[i].v)/float64(items[i].w) > float64(items[j].v)/float64(items[j].w)
	})
	// Make greedy choices in a loop
	res := 0.0
	for _, item := range items {
		if item.w <= cap {
			// If the whole item fits, put it in the knapsack
			res += float64(item.v)
			cap -= item.w
		} else {
			// If the whole item does not fit, take a fraction of it
			res += float64(item.v) / float64(item.w) * float64(cap)
			// The knapsack is full, so exit the loop
			break
		}
	}
	return res
}
