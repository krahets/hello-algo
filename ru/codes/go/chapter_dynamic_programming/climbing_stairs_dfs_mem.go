// File: climbing_stairs_dfs_mem.go
// Created Time: 2023-07-18
// Author: Reanon (793584285@qq.com)

package chapter_dynamic_programming

/* Поиск с мемоизацией */
func dfsMem(i int, mem []int) int {
	// dp[1] и dp[2] уже известны, вернуть их
	if i == 1 || i == 2 {
		return i
	}
	// Если запись dp[i] существует, сразу вернуть ее
	if mem[i] != -1 {
		return mem[i]
	}
	// dp[i] = dp[i-1] + dp[i-2]
	count := dfsMem(i-1, mem) + dfsMem(i-2, mem)
	// Сохранить dp[i]
	mem[i] = count
	return count
}

/* Подъем по лестнице: поиск с мемоизацией */
func climbingStairsDFSMem(n int) int {
	// mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
	mem := make([]int, n+1)
	for i := range mem {
		mem[i] = -1
	}
	return dfsMem(n, mem)
}
