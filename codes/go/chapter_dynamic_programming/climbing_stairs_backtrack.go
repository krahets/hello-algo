// File: climbing_stairs_backtrack.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 回溯 */
func backtrack(choices []int, state, n int, res []int) {
	// 当爬到第 n 阶时，方案数量加 1
	if state == n {
		res[0] = res[0] + 1
	}
	// 遍历所有选择
	for _, choice := range choices {
		// 剪枝：不允许越过第 n 阶
		if state+choice > n {
			continue
		}
		// 尝试：做出选择，更新状态
		backtrack(choices, state+choice, n, res)
		// 回退
	}
}

/* 爬楼梯：回溯 */
func climbingStairsBacktrack(n int) int {
	// 可选择向上爬 1 阶或 2 阶
	choices := []int{1, 2}
	// 从第 0 阶开始爬
	state := 0
	res := make([]int, 1)
	// 使用 res[0] 记录方案数量
	res[0] = 0
	backtrack(choices, state, n, res)
	return res[0]
}
