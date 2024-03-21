// File: edit_distance.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 编辑距离：暴力搜索 */
func editDistanceDFS(s string, t string, i int, j int) int {
	// 若 s 和 t 都为空，则返回 0
	if i == 0 && j == 0 {
		return 0
	}
	// 若 s 为空，则返回 t 长度
	if i == 0 {
		return j
	}
	// 若 t 为空，则返回 s 长度
	if j == 0 {
		return i
	}
	// 若两字符相等，则直接跳过此两字符
	if s[i-1] == t[j-1] {
		return editDistanceDFS(s, t, i-1, j-1)
	}
	// 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
	insert := editDistanceDFS(s, t, i, j-1)
	deleted := editDistanceDFS(s, t, i-1, j)
	replace := editDistanceDFS(s, t, i-1, j-1)
	// 返回最少编辑步数
	return MinInt(MinInt(insert, deleted), replace) + 1
}

/* 编辑距离：记忆化搜索 */
func editDistanceDFSMem(s string, t string, mem [][]int, i int, j int) int {
	// 若 s 和 t 都为空，则返回 0
	if i == 0 && j == 0 {
		return 0
	}
	// 若 s 为空，则返回 t 长度
	if i == 0 {
		return j
	}
	// 若 t 为空，则返回 s 长度
	if j == 0 {
		return i
	}
	// 若已有记录，则直接返回之
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// 若两字符相等，则直接跳过此两字符
	if s[i-1] == t[j-1] {
		return editDistanceDFSMem(s, t, mem, i-1, j-1)
	}
	// 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
	insert := editDistanceDFSMem(s, t, mem, i, j-1)
	deleted := editDistanceDFSMem(s, t, mem, i-1, j)
	replace := editDistanceDFSMem(s, t, mem, i-1, j-1)
	// 记录并返回最少编辑步数
	mem[i][j] = MinInt(MinInt(insert, deleted), replace) + 1
	return mem[i][j]
}

/* 编辑距离：动态规划 */
func editDistanceDP(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, m+1)
	}
	// 状态转移：首行首列
	for i := 1; i <= n; i++ {
		dp[i][0] = i
	}
	for j := 1; j <= m; j++ {
		dp[0][j] = j
	}
	// 状态转移：其余行和列
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				// 若两字符相等，则直接跳过此两字符
				dp[i][j] = dp[i-1][j-1]
			} else {
				// 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
				dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
			}
		}
	}
	return dp[n][m]
}

/* 编辑距离：空间优化后的动态规划 */
func editDistanceDPComp(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([]int, m+1)
	// 状态转移：首行
	for j := 1; j <= m; j++ {
		dp[j] = j
	}
	// 状态转移：其余行
	for i := 1; i <= n; i++ {
		// 状态转移：首列
		leftUp := dp[0] // 暂存 dp[i-1, j-1]
		dp[0] = i
		// 状态转移：其余列
		for j := 1; j <= m; j++ {
			temp := dp[j]
			if s[i-1] == t[j-1] {
				// 若两字符相等，则直接跳过此两字符
				dp[j] = leftUp
			} else {
				// 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
				dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
			}
			leftUp = temp // 更新为下一轮的 dp[i-1, j-1]
		}
	}
	return dp[m]
}

func MinInt(a, b int) int {
	if a < b {
		return a
	}
	return b
}
