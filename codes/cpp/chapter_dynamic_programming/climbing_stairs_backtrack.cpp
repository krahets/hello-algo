/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 回溯：统计到达第 n 阶的方案数 */
void backtrack(int n, int current_step, int &count) {
    // 成功到达第 n 阶，方案数 +1
    if (current_step == n) {
        count++;
        return;
    }

    // 尝试爬 1 阶（不越界才继续）
    if (current_step + 1 <= n) {
        backtrack(n, current_step + 1, count);
    }

    // 尝试爬 2 阶（不越界才继续）
    if (current_step + 2 <= n) {
        backtrack(n, current_step + 2, count);
    }
}

/* 爬楼梯：回溯法 */
int climbingStairsBacktrack(int n) {
    // 非法输入直接返回 0
    if (n <= 0) return 0;

    int count = 0;
    // 从第 0 阶开始爬
    backtrack(n, 0, count);
    return count;
}

/* 主函数测试 */
int main() {
    int n = 9;
    int res = climbingStairsBacktrack(n);
    cout << "爬 " << n << " 阶楼梯共有 " << res << " 种方案" << endl;

    return 0;
}
