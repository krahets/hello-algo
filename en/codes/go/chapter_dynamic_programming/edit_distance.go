// File: edit_distance.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Edit distance: Brute force search */
func editDistanceDFS(s string, t string, i int, j int) int {
	// If both s and t are empty, return 0
	if i == 0 && j == 0 {
		return 0
	}
	// If s is empty, return the length of t
	if i == 0 {
		return j
	}
	// If t is empty, return the length of s
	if j == 0 {
		return i
	}
	// If the two characters are equal, skip these two characters
	if s[i-1] == t[j-1] {
		return editDistanceDFS(s, t, i-1, j-1)
	}
	// The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
	insert := editDistanceDFS(s, t, i, j-1)
	deleted := editDistanceDFS(s, t, i-1, j)
	replace := editDistanceDFS(s, t, i-1, j-1)
	// Return the minimum number of edits
	return MinInt(MinInt(insert, deleted), replace) + 1
}

/* Edit distance: Memoized search */
func editDistanceDFSMem(s string, t string, mem [][]int, i int, j int) int {
	// If both s and t are empty, return 0
	if i == 0 && j == 0 {
		return 0
	}
	// If s is empty, return the length of t
	if i == 0 {
		return j
	}
	// If t is empty, return the length of s
	if j == 0 {
		return i
	}
	// If there is a record, return it
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// If the two characters are equal, skip these two characters
	if s[i-1] == t[j-1] {
		return editDistanceDFSMem(s, t, mem, i-1, j-1)
	}
	// The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
	insert := editDistanceDFSMem(s, t, mem, i, j-1)
	deleted := editDistanceDFSMem(s, t, mem, i-1, j)
	replace := editDistanceDFSMem(s, t, mem, i-1, j-1)
	// Record and return the minimum number of edits
	mem[i][j] = MinInt(MinInt(insert, deleted), replace) + 1
	return mem[i][j]
}

/* Edit distance: Dynamic programming */
func editDistanceDP(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, m+1)
	}
	// State transition: first row and first column
	for i := 1; i <= n; i++ {
		dp[i][0] = i
	}
	for j := 1; j <= m; j++ {
		dp[0][j] = j
	}
	// State transition: the rest of the rows and columns
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				// If the two characters are equal, skip these two characters
				dp[i][j] = dp[i-1][j-1]
			} else {
				// The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
				dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
			}
		}
	}
	return dp[n][m]
}

/* Edit distance: Space-optimized dynamic programming */
func editDistanceDPComp(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([]int, m+1)
	// State transition: first row
	for j := 1; j <= m; j++ {
		dp[j] = j
	}
	// State transition: the rest of the rows
	for i := 1; i <= n; i++ {
		// State transition: first column
		leftUp := dp[0] // Temporarily store dp[i-1, j-1]
		dp[0] = i
		// State transition: the rest of the columns
		for j := 1; j <= m; j++ {
			temp := dp[j]
			if s[i-1] == t[j-1] {
				// If the two characters are equal, skip these two characters
				dp[j] = leftUp
			} else {
				// The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
				dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
			}
			leftUp = temp // Update for the next round of dp[i-1, j-1]
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
