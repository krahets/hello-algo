/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 메모이제이션을 이용한 탐색 */
int dfs(int i, vector<int> &mem) {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i == 1 || i == 2)
        return i;
    // dp[i]의 기록이 있으면 해당 값을 바로 반환한다
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i]를 기록한다
    mem[i] = count;
    return count;
}

/* 계단 오르기: 메모이제이션을 이용한 탐색 */
int climbingStairsDFSMem(int n) {
    // mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* 실행 코드 */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "계단 수: " << n << " 칸, 오르는 방법은 총 " << res << " 가지이다" << endl;

    return 0;
}
