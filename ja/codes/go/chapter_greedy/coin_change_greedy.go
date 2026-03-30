// File: coin_change_greedy.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_greedy

/* コイン交換：貪欲法 */
func coinChangeGreedy(coins []int, amt int) int {
	// coins リストはソート済みと仮定する
	i := len(coins) - 1
	count := 0
	// 残額がなくなるまで貪欲選択を繰り返す
	for amt > 0 {
		// 残額以下で最も近い硬貨を見つける
		for i > 0 && coins[i] > amt {
			i--
		}
		// coins[i] を選択する
		amt -= coins[i]
		count++
	}
	// 実行可能な解が見つからなければ -1 を返す
	if amt != 0 {
		return -1
	}
	return count
}
