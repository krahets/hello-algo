/**
 * File: climbing_stairs_dfs_mem.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Поиск с мемоизацией */
int dfs(int i, int *mem) {
    // dp[1] и dp[2] уже известны, вернуть их
    if (i == 1 || i == 2)
        return i;
    // Если запись dp[i] существует, сразу вернуть ее
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Сохранить dp[i]
    mem[i] = count;
    return count;
}

/* Подъем по лестнице: поиск с мемоизацией */
int climbingStairsDFSMem(int n) {
    // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
    int *mem = (int *)malloc((n + 1) * sizeof(int));
    for (int i = 0; i <= n; i++) {
        mem[i] = -1;
    }
    int result = dfs(n, mem);
    free(mem);
    return result;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    printf("Количество способов подняться по лестнице из %d ступеней: %d\n", n, res);

    return 0;
}