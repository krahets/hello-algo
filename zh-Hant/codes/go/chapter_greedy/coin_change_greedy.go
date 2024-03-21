// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* 零钱兑换：贪心 */
func coinChangeGreedy(coins []int, amt int) int {
	// 假设 coins 列表有序
	i := len(coins) - 1
	count := 0
	// 循环进行贪心选择，直到无剩余金额
	for amt > 0 {
		// 找到小于且最接近剩余金额的硬币
		for i > 0 && coins[i] > amt {
			i--
		}
		// 选择 coins[i]
		amt -= coins[i]
		count++
	}
	// 若未找到可行方案，则返回 -1
	if amt != 0 {
		return -1
	}
	return count
}
