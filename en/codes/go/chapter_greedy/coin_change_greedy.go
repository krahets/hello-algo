// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* Coin change: greedy algorithm */
func coinChangeGreedy(coins []int, amt int) int {
	// Assume the coins list is sorted in ascending order
	i := len(coins) - 1
	count := 0
	// Repeatedly make greedy choices until no amount remains
	for amt > 0 {
		// Find the largest coin no greater than the remaining amount
		for i > 0 && coins[i] > amt {
			i--
		}
		// Choose coins[i]
		amt -= coins[i]
		count++
	}
	// Return -1 if no feasible solution was found
	if amt != 0 {
		return -1
	}
	return count
}
