// File: edit_distance.go
// Created Time: 2023-07-23
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* 편집 거리: 완전 탐색 */
func editDistanceDFS(s string, t string, i int, j int) int {
	// s와 t가 모두 비어 있으면 0을 반환한다
	if i == 0 && j == 0 {
		return 0
	}
	// s가 비어 있으면 t의 길이를 반환한다
	if i == 0 {
		return j
	}
	// t가 비어 있으면 s의 길이를 반환한다
	if j == 0 {
		return i
	}
	// 두 문자가 같으면 두 문자를 바로 건너뛴다
	if s[i-1] == t[j-1] {
		return editDistanceDFS(s, t, i-1, j-1)
	}
	// 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
	insert := editDistanceDFS(s, t, i, j-1)
	deleted := editDistanceDFS(s, t, i-1, j)
	replace := editDistanceDFS(s, t, i-1, j-1)
	// 최소 편집 횟수를 반환한다
	return MinInt(MinInt(insert, deleted), replace) + 1
}

/* 편집 거리: 메모이제이션을 이용한 탐색 */
func editDistanceDFSMem(s string, t string, mem [][]int, i int, j int) int {
	// s와 t가 모두 비어 있으면 0을 반환한다
	if i == 0 && j == 0 {
		return 0
	}
	// s가 비어 있으면 t의 길이를 반환한다
	if i == 0 {
		return j
	}
	// t가 비어 있으면 s의 길이를 반환한다
	if j == 0 {
		return i
	}
	// 기록이 이미 있으면 해당 값을 바로 반환한다
	if mem[i][j] != -1 {
		return mem[i][j]
	}
	// 두 문자가 같으면 두 문자를 바로 건너뛴다
	if s[i-1] == t[j-1] {
		return editDistanceDFSMem(s, t, mem, i-1, j-1)
	}
	// 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
	insert := editDistanceDFSMem(s, t, mem, i, j-1)
	deleted := editDistanceDFSMem(s, t, mem, i-1, j)
	replace := editDistanceDFSMem(s, t, mem, i-1, j-1)
	// 최소 편집 횟수를 기록하고 반환한다
	mem[i][j] = MinInt(MinInt(insert, deleted), replace) + 1
	return mem[i][j]
}

/* 편집 거리: 동적 계획법 */
func editDistanceDP(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([][]int, n+1)
	for i := 0; i <= n; i++ {
		dp[i] = make([]int, m+1)
	}
	// 상태 전이: 첫 번째 행과 첫 번째 열
	for i := 1; i <= n; i++ {
		dp[i][0] = i
	}
	for j := 1; j <= m; j++ {
		dp[0][j] = j
	}
	// 상태 전이: 나머지 행과 열
	for i := 1; i <= n; i++ {
		for j := 1; j <= m; j++ {
			if s[i-1] == t[j-1] {
				// 두 문자가 같으면 두 문자를 바로 건너뛴다
				dp[i][j] = dp[i-1][j-1]
			} else {
				// 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
				dp[i][j] = MinInt(MinInt(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1]) + 1
			}
		}
	}
	return dp[n][m]
}

/* 편집 거리: 공간을 최적화한 동적 계획법 */
func editDistanceDPComp(s string, t string) int {
	n := len(s)
	m := len(t)
	dp := make([]int, m+1)
	// 상태 전이: 첫 번째 행
	for j := 1; j <= m; j++ {
		dp[j] = j
	}
	// 상태 전이: 나머지 행
	for i := 1; i <= n; i++ {
		// 상태 전이: 첫 번째 열
		leftUp := dp[0] // dp[i-1, j-1]을 임시로 저장한다
		dp[0] = i
		// 상태 전이: 나머지 열
		for j := 1; j <= m; j++ {
			temp := dp[j]
			if s[i-1] == t[j-1] {
				// 두 문자가 같으면 두 문자를 바로 건너뛴다
				dp[j] = leftUp
			} else {
				// 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
				dp[j] = MinInt(MinInt(dp[j-1], dp[j]), leftUp) + 1
			}
			leftUp = temp // 다음 반복의 dp[i-1, j-1]로 갱신한다
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
