// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* 零錢兌換：貪婪法 */
func coinChangeGreedy(coins []int, amt int) int {
	// 假設硬幣清單 coins 已依面額遞增排序
	i := len(coins) - 1
	count := 0
	// 反覆依貪婪策略選取硬幣，直到剩餘金額為零
	for amt > 0 {
		// 找出面額小於且最接近剩餘金額的硬幣
		for i > 0 && coins[i] > amt {
			i--
		}
		// 選取 coins[i]
		amt -= coins[i]
		count++
	}
	// 若找不到可行解，則回傳 -1
	if amt != 0 {
		return -1
	}
	return count
}
