// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* 동전 교환: 탐욕 */
func coinChangeGreedy(coins []int, amt int) int {
	// coins 리스트가 정렬되어 있다고 가정한다
	i := len(coins) - 1
	count := 0
	// 남은 금액이 없을 때까지 탐욕적 선택을 반복한다
	for amt > 0 {
		// 남은 금액보다 작으면서 가장 가까운 금액의 동전을 찾는다
		for i > 0 && coins[i] > amt {
			i--
		}
		// coins[i]를 선택한다
		amt -= coins[i]
		count++
	}
	// 가능한 방법을 찾지 못하면 -1을 반환한다
	if amt != 0 {
		return -1
	}
	return count
}
