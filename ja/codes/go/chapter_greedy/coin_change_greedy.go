// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* 硬貨の両替：貪欲法 */
func coinChangeGreedy(coins []int, amt int) int {
	// coins リストはソート済みと仮定する
	i := len(coins) - 1
	count := 0
	// 残額がなくなるまで貪欲な選択を繰り返す
	for amt > 0 {
		// 残額より小さく、残額に最も近い硬貨を探す
		for i > 0 && coins[i] > amt {
			i--
		}
		// coins[i] を選ぶ
		amt -= coins[i]
		count++
	}
	// 実行可能な方法が見つからなかった場合、-1 を返す
	if amt != 0 {
		return -1
	}
	return count
}
