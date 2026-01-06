/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* メモ化探索 */
int dfs(int i, vector<int> &mem) {
    // 既知の dp[1] と dp[2] を返す
    if (i == 1 || i == 2)
        return i;
    // dp[i] の記録がある場合、それを返す
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録
    mem[i] = count;
    return count;
}

/* 階段登り：メモ化探索 */
int climbingStairsDFSMem(int n) {
    // mem[i] は i 段目に登る総解数を記録、-1 は記録なしを意味する
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* ドライバーコード */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << n << "段の階段を登る解は" << res << "通りです" << endl;

    return 0;
}