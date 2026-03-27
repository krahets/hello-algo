/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск с мемоизацией */
int dfs(int i, vector<int> &mem) {
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
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "Количество способов подняться по лестнице из " << n << " ступеней: " << res << " вариантов" << endl;

    return 0;
}
