// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 回溯 */
func backtrack(choices []int, state, n int, res []int) {
	// 爬到第 n 階時，將走法數加 1
	if state == n {
		res[0] = res[0] + 1
	}
	// 走訪所有選項
	for _, choice := range choices {
		// 剪枝：不能越過第 n 階
		if state+choice > n {
			continue
		}
		// 嘗試：做出選擇，更新狀態
		backtrack(choices, state+choice, n, res)
		// 撤銷選擇
	}
}

/* 爬樓梯：回溯法 */
func climbingStairsBacktrack(n int) int {
	// 每次可以往上爬 1 階或 2 階
	choices := []int{1, 2}
	// 從第 0 階開始爬
	state := 0
	res := make([]int, 1)
	// 用 res[0] 記錄走法數
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
