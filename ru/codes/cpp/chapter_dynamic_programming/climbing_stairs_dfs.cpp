/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск */
int dfs(int i) {
    // dp[1] и dp[2] уже известны, вернуть их
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Подъем по лестнице: поиск */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    cout << "Количество способов подняться по лестнице из " << n << " ступеней: " << res << " вариантов" << endl;

    return 0;
}
