/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск с мемоизацией */
int dfs(int i, vector<int> &mem) {
    // Для dp[1] и dp[2] вернуть известные значения
    if (i == 1 || i == 2)
        return i;
    // Если dp[i] уже вычислено, вернуть сохранённое значение
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Сохранить dp[i]
    mem[i] = count;
    return count;
}

/* Подъём по лестнице: поиск с мемоизацией */
int climbingStairsDFSMem(int n) {
    // mem[i] хранит число способов достичь ступени i, а -1 означает отсутствие записи
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* Основная программа */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "Для ступени " << n << " результат равен " << res << " (число способов подъёма)." << endl;

    return 0;
}
