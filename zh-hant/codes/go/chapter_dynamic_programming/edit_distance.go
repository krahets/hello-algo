// File: edit_distance.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 編輯距離：暴力搜尋 */
func editDistanceDFS(s string, t string, i int, j int) int {
	// 若 s 和 t 皆為空字串，回傳 0
	if i == 0 && j == 0 {
		return 0
	}
	// 若 s 為空字串，回傳 t 的長度
	if i == 0 {
		return j
	}
	// 若 t 為空字串，回傳 s 的長度
	if j == 0 {
		return i
	}
	// 若兩個字元相同，直接跳過這兩個字元
	if s[i-1] == t[j-1] {
		return editDistanceDFS(s, t, i-1, j-1)
	}
	// 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
	insert := editDistanceDFS(s, t, i, j-1)
	deleted := editDistanceDFS(s, t, i-1, j)
	replace := editDistanceDFS(s, t, i-1, j-1)
	// 回傳最少編輯步數
	return MinInt(MinInt(insert, deleted), replace) + 1
}

/* 編輯距離：記憶化搜尋 */
func editDistanceDFSMem(s string, t string, mem [][]int, i int, j int) int {
	// 若 s 和 t 皆為空字串，回傳 0
	if i == 0 && j == 0 {
		return 0
	}
	// 若 s 為空字串，回傳 t 的長度
	if i == 0 {
		return j
	}
	// 若 t 為空字串，回傳 s 的長度
	if j == 0 {
		return i
	}
	// 若已有紀錄，直接回傳該值
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// 若兩個字元相同，直接跳過這兩個字元
	if s[i-1] == t[j-1] {
		return editDistanceDFSMem(s, t, mem, i-1, j-1)
	}
	// 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
	insert := editDistanceDFSMem(s, t, mem, i, j-1)
	deleted := editDistanceDFSMem(s, t, mem, i-1, j)
	replace := editDistanceDFSMem(s, t, mem, i-1, j-1)
	// 記錄並回傳最少編輯步數
	mem[i][j] = MinInt(MinInt(insert, deleted), replace) + 1
	return mem[i][j]
}

/* 編輯距離：動態規劃 */
func editDistanceDP(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, m+1)
	}
	// 狀態轉移：第一列和第一欄
	for i := 1; i <= n; i++ {
		dp[i][0] = i
	}
	for j := 1; j <= m; j++ {
		dp[0][j] = j
	}
	// 狀態轉移：其餘各列與各欄
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				// 若兩個字元相同，直接跳過這兩個字元
				dp[i][j] = dp[i-1][j-1]
			} else {
				// 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
				dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
			}
		}
	}
	return dp[n][m]
}

/* 編輯距離：空間最佳化後的動態規劃 */
func editDistanceDPComp(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([]int, m+1)
	// 狀態轉移：第一列
	for j := 1; j <= m; j++ {
		dp[j] = j
	}
	// 狀態轉移：其餘各列
	for i := 1; i <= n; i++ {
		// 狀態轉移：第一欄
		leftUp := dp[0] // 暫存 dp[i-1, j-1]
		dp[0] = i
		// 狀態轉移：其餘各欄
		for j := 1; j <= m; j++ {
			temp := dp[j]
			if s[i-1] == t[j-1] {
				// 若兩個字元相同，直接跳過這兩個字元
				dp[j] = leftUp
			} else {
				// 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
				dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
			}
			leftUp = temp // 更新為下一輪的 dp[i-1, j-1]
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
