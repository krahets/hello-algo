// File: edit_distance.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Edit distance with brute-force search */
func editDistanceDFS(s string, t string, i int, j int) int {
	// Return 0 if both s and t are empty
	if i == 0 && j == 0 {
		return 0
	}
	// Return the length of t if s is empty
	if i == 0 {
		return j
	}
	// Return the length of s if t is empty
	if j == 0 {
		return i
	}
	// Skip both characters if they match
	if s[i-1] == t[j-1] {
		return editDistanceDFS(s, t, i-1, j-1)
	}
	// Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
	insert := editDistanceDFS(s, t, i, j-1)
	deleted := editDistanceDFS(s, t, i-1, j)
	replace := editDistanceDFS(s, t, i-1, j-1)
	// Return the minimum number of edits
	return MinInt(MinInt(insert, deleted), replace) + 1
}

/* Edit distance with memoized search */
func editDistanceDFSMem(s string, t string, mem [][]int, i int, j int) int {
	// Return 0 if both s and t are empty
	if i == 0 && j == 0 {
		return 0
	}
	// Return the length of t if s is empty
	if i == 0 {
		return j
	}
	// Return the length of s if t is empty
	if j == 0 {
		return i
	}
	// Return the cached result if available
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// Skip both characters if they match
	if s[i-1] == t[j-1] {
		return editDistanceDFSMem(s, t, mem, i-1, j-1)
	}
	// Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
	insert := editDistanceDFSMem(s, t, mem, i, j-1)
	deleted := editDistanceDFSMem(s, t, mem, i-1, j)
	replace := editDistanceDFSMem(s, t, mem, i-1, j-1)
	// Cache and return the minimum number of edits
	mem[i][j] = MinInt(MinInt(insert, deleted), replace) + 1
	return mem[i][j]
}

/* Edit distance with dynamic programming */
func editDistanceDP(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, m+1)
	}
	// State transitions for the first row and column
	for i := 1; i <= n; i++ {
		dp[i][0] = i
	}
	for j := 1; j <= m; j++ {
		dp[0][j] = j
	}
	// State transitions for the remaining rows and columns
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				// Skip both characters if they match
				dp[i][j] = dp[i-1][j-1]
			} else {
				// Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
				dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
			}
		}
	}
	return dp[n][m]
}

/* Edit distance with space-optimized dynamic programming */
func editDistanceDPComp(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([]int, m+1)
	// State transitions for the first row
	for j := 1; j <= m; j++ {
		dp[j] = j
	}
	// State transitions for the remaining rows
	for i := 1; i <= n; i++ {
		// State transitions for the first column
		leftUp := dp[0] // Save dp[i-1, j-1] temporarily
		dp[0] = i
		// State transitions for the remaining columns
		for j := 1; j <= m; j++ {
			temp := dp[j]
			if s[i-1] == t[j-1] {
				// Skip both characters if they match
				dp[j] = leftUp
			} else {
				// Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
				dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
			}
			leftUp = temp // Update the saved value to hold dp[i-1, j-1] for the next iteration
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
