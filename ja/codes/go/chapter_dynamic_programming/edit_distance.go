// File: edit_distance.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 編集距離：総当たり探索 */
func editDistanceDFS(s string, t string, i int, j int) int {
	// s と t がともに空なら 0 を返す
	if i == 0 && j == 0 {
		return 0
	}
	// s が空なら t の長さを返す
	if i == 0 {
		return j
	}
	// t が空なら s の長さを返す
	if j == 0 {
		return i
	}
	// 2 つの文字が等しければ、その 2 文字をそのままスキップする
	if s[i-1] == t[j-1] {
		return editDistanceDFS(s, t, i-1, j-1)
	}
	// 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
	insert := editDistanceDFS(s, t, i, j-1)
	deleted := editDistanceDFS(s, t, i-1, j)
	replace := editDistanceDFS(s, t, i-1, j-1)
	// 最小編集回数を返す
	return MinInt(MinInt(insert, deleted), replace) + 1
}

/* 編集距離：メモ化探索 */
func editDistanceDFSMem(s string, t string, mem [][]int, i int, j int) int {
	// s と t がともに空なら 0 を返す
	if i == 0 && j == 0 {
		return 0
	}
	// s が空なら t の長さを返す
	if i == 0 {
		return j
	}
	// t が空なら s の長さを返す
	if j == 0 {
		return i
	}
	// 記録済みなら、それをそのまま返す
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// 2 つの文字が等しければ、その 2 文字をそのままスキップする
	if s[i-1] == t[j-1] {
		return editDistanceDFSMem(s, t, mem, i-1, j-1)
	}
	// 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
	insert := editDistanceDFSMem(s, t, mem, i, j-1)
	deleted := editDistanceDFSMem(s, t, mem, i-1, j)
	replace := editDistanceDFSMem(s, t, mem, i-1, j-1)
	// 最小編集回数を記録して返す
	mem[i][j] = MinInt(MinInt(insert, deleted), replace) + 1
	return mem[i][j]
}

/* 編集距離：動的計画法 */
func editDistanceDP(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, m+1)
	}
	// 状態遷移：先頭行と先頭列
	for i := 1; i <= n; i++ {
		dp[i][0] = i
	}
	for j := 1; j <= m; j++ {
		dp[0][j] = j
	}
	// 状態遷移: 残りの行と列
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				// 2 つの文字が等しければ、その 2 文字をそのままスキップする
				dp[i][j] = dp[i-1][j-1]
			} else {
				// 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
				dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
			}
		}
	}
	return dp[n][m]
}

/* 編集距離：空間最適化した動的計画法 */
func editDistanceDPComp(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([]int, m+1)
	// 状態遷移：先頭行
	for j := 1; j <= m; j++ {
		dp[j] = j
	}
	// 状態遷移：残りの行
	for i := 1; i <= n; i++ {
		// 状態遷移：先頭列
		leftUp := dp[0] // dp[i-1, j-1] を一時保存する
		dp[0] = i
		// 状態遷移：残りの列
		for j := 1; j <= m; j++ {
			temp := dp[j]
			if s[i-1] == t[j-1] {
				// 2 つの文字が等しければ、その 2 文字をそのままスキップする
				dp[j] = leftUp
			} else {
				// 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
				dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
			}
			leftUp = temp // 次の反復の dp[i-1, j-1] に更新する
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
