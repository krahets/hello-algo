// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* 硬貨の両替（貪欲法） */
func coinChangeGreedy(coins []int, amt int) int {
	// リスト coins はソート済みとする
	i := len(coins) - 1
	count := 0
	// 残額がなくなるまで貪欲選択を繰り返す
	for amt > 0 {
		// 残額以下で額面が最大の硬貨を探す
		for i > 0 && coins[i] > amt {
			i--
		}
		// coins[i] を選ぶ
		amt -= coins[i]
		count++
	}
	// 解が見つからなければ -1 を返す
	if amt != 0 {
		return -1
	}
	return count
}
