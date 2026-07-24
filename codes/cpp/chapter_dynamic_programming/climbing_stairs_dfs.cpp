/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
using namespace std;

/* 深度优先搜索：计算爬到第 i 阶楼梯的方案数 */
int dfs(int i) {
    // 递归终止条件：1阶、2阶是已知解
    if (i == 1 || i == 2) {
        return i;
    }
    // 递推公式：第 i 阶 = 从 i-1 爬1阶 + 从 i-2 爬2阶
    return dfs(i - 1) + dfs(i - 2);
}

/* 爬楼梯：纯递归 DFS 解法 */
int climbingStairsDFS(int n) {
    // 边界处理：非法输入直接返回 0
    if (n <= 0) {
        return 0;
    }
    return dfs(n);
}

/* 主函数测试 */
int main() {
    int n = 9;
    int res = climbingStairsDFS(n);
    cout << "爬 " << n << " 阶楼梯共有 " << res << " 种方案" << endl;
    return 0;
}
