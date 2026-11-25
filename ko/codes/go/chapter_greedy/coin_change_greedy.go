// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* 탐욕 알고리즘으로 거스름돈 만들기 */
func coinChangeGreedy(coins []int, amt int) int {
	// coins 리스트는 오름차순으로 정렬되어 있다고 가정한다
	i := len(coins) - 1
	count := 0
	// 남은 금액이 없어질 때까지 탐욕 선택을 반복한다
	for amt > 0 {
		// 남은 금액보다 작으면서 그 금액에 가장 가까운 동전을 찾는다
		for i > 0 && coins[i] > amt {
			i--
		}
		// coins[i] 선택
		amt -= coins[i]
		count++
	}
	// 가능한 방법을 찾지 못하면 -1을 반환한다
	if amt != 0 {
		return -1
	}
	return count
}
