/**
 * File: edit_distance.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <string>
#include <algorithm> // min
using namespace std;

/* 编辑距离：暴力搜索 */
int editDistanceDFS(string s, string t, int i, int j) {
    // 若 s 和 t 都为空，则返回 0
    if (i == 0 && j == 0)
        return 0;
    // 若 s 为空，则返回 t 长度
    if (i == 0)
        return j;
    // 若 t 为空，则返回 s 长度
    if (j == 0)
        return i;
    // 若两字符相等，则直接跳过
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);

    // 三种操作：插入、删除、替换
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del    = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);

    return min(min(insert, del), replace) + 1;
}

/* 编辑距离：记忆化搜索 */
int editDistanceDFSMem(string s, string t, vector<vector<int>> &mem, int i, int j) {
    if (i == 0 && j == 0)
        return 0;
    if (i == 0)
        return j;
    if (j == 0)
        return i;
    // 已缓存，直接返回
    if (mem[i][j] != -1)
        return mem[i][j];
    // 字符相等，无需操作
    if (s[i - 1] == t[j - 1]) {
        mem[i][j] = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        return mem[i][j];
    }
    // 三种操作取最小值
    int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    int del    = editDistanceDFSMem(s, t, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    mem[i][j] = min(min(insert, del), replace) + 1;
    return mem[i][j];
}

/* 编辑距离：动态规划 */
int editDistanceDP(string s, string t) {
    int n = s.size(), m = t.size();
    vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));

    // 初始化边界：空字符串
    for (int i = 1; i <= n; ++i) dp[i][0] = i;
    for (int j = 1; j <= m; ++j) dp[0][j] = j;

    // 状态转移
    for (int i = 1; i <= n; ++i) {
        for (int j = 1; j <= m; ++j) {
            if (s[i - 1] == t[j - 1]) {
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* 编辑距离：空间优化后的动态规划 */
int editDistanceDPComp(string s, string t) {
    int n = s.size(), m = t.size();
    vector<int> dp(m + 1, 0);

    // 初始化首行
    for (int j = 1; j <= m; ++j)
        dp[j] = j;

    for (int i = 1; i <= n; ++i) {
        int leftup = dp[0];  // 保存 dp[i-1][j-1]
        dp[0] = i;

        for (int j = 1; j <= m; ++j) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                dp[j] = leftup;
            } else {
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp;
        }
    }
    return dp[m];
}

/* 主函数测试 */
int main() {
    string s = "bag";
    string t = "pack";

    cout << "将 " << s << " 变为 " << t << " 的最少编辑步数：\n\n";

    int res = editDistanceDFS(s, t, s.size(), t.size());
    cout << "暴力搜索：\t" << res << endl;

    vector<vector<int>> mem(s.size() + 1, vector<int>(t.size() + 1, -1));
    res = editDistanceDFSMem(s, t, mem, s.size(), t.size());
    cout << "记忆化搜索：\t" << res << endl;

    res = editDistanceDP(s, t);
    cout << "动态规划：\t" << res << endl;

    res = editDistanceDPComp(s, t);
    cout << "空间优化DP：\t" << res << endl;

    return 0;
}
