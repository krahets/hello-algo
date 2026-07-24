/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2025-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 记忆化搜索：计算爬到第 i 阶的方案数 */
int dfs(int i, vector<int>& mem) {
    // 递归终止条件：1 阶、2 阶直接返回已知解
    if (i == 1 || i == 2) {
        return i;
    }
    // 若已计算过，直接返回记忆结果
    if (mem[i] != -1) {
        return mem[i];
    }
    // 递推：dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 记录当前结果，避免重复计算
    mem[i] = count;
    return count;
}

/* 爬楼梯：记忆化 DFS 解法 */
int climbingStairsDFSMem(int n) {
    // 非法输入直接返回 0
    if (n <= 0) {
        return 0;
    }
    // mem[i] 记录爬到第 i 阶的方案数，-1 表示未计算
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* 主函数测试 */
int main() {
    int n = 9;
    int res = climbingStairsDFSMem(n);
    cout << "爬 " << n << " 阶楼梯共有 " << res << " 种方案" << endl;
    return 0;
}
