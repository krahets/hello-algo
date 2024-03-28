// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* 零錢兌換：貪婪 */
func coinChangeGreedy(coins []int, amt int) int {
	// 假設 coins 串列有序
	i := len(coins) - 1
	count := 0
	// 迴圈進行貪婪選擇，直到無剩餘金額
	for amt > 0 {
		// 找到小於且最接近剩餘金額的硬幣
		for i > 0 && coins[i] > amt {
			i--
		}
		// 選擇 coins[i]
		amt -= coins[i]
		count++
	}
	// 若未找到可行方案，則返回 -1
	if amt != 0 {
		return -1
	}
	return count
}
