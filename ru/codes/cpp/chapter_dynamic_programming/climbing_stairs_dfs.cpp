/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск */
int dfs(int i) {
    // Для dp[1] и dp[2] вернуть известные значения
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Подъём по лестнице: поиск */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* Основная программа */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    cout << "Для ступени " << n << " результат равен " << res << " (число способов подъёма)." << endl;

    return 0;
}
