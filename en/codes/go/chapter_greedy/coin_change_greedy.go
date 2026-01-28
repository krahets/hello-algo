// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* Coin change: Greedy algorithm */
func coinChangeGreedy(coins []int, amt int) int {
	// Assume coins list is sorted
	i := len(coins) - 1
	count := 0
	// Loop to make greedy choices until no remaining amount
	for amt > 0 {
		// Find the coin that is less than and closest to the remaining amount
		for i > 0 && coins[i] > amt {
			i--
		}
		// Choose coins[i]
		amt -= coins[i]
		count++
	}
	// If no feasible solution is found, return -1
	if amt != 0 {
		return -1
	}
	return count
}
