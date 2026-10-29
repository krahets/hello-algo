/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* メモ化探索 */
int dfs(int i, vector<int> &mem) {
    // dp[1] と dp[2] は既知なので、その値を返す
    if (i == 1 || i == 2)
        return i;
    // dp[i] が記録済みなら、その値をそのまま返す
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    return count;
}

/* 階段の上り方：メモ化探索 */
int climbingStairsDFSMem(int n) {
    // mem[i] は i 段目まで上る方法の総数を記録し、-1 は未記録を表す
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* 実行用コード */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "上る段数： " << n << " 段、上り方は全部で " << res << " 通り" << endl;

    return 0;
}
