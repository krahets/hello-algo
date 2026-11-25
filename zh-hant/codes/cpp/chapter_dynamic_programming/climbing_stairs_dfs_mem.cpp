/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 記憶化搜尋 */
int dfs(int i, vector<int> &mem) {
    // 已知 dp[1] 和 dp[2]，直接回傳對應的值
    if (i == 1 || i == 2)
        return i;
    // 若已有 dp[i] 的紀錄，就直接回傳該值
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 記錄 dp[i]
    mem[i] = count;
    return count;
}

/* 爬樓梯：記憶化搜尋 */
int climbingStairsDFSMem(int n) {
    // mem[i] 記錄爬到第 i 階的走法總數，-1 表示尚無紀錄
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* 主程式 */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "爬 " << n << " 階樓梯共有 " << res << " 種走法" << endl;

    return 0;
}
