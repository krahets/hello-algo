/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 탐색 */
int dfs(int i) {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 계단 오르기: 탐색 */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* 실행 코드 */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    cout << "계단 수: " << n << " 칸, 오르는 방법은 총 " << res << " 가지이다" << endl;

    return 0;
}
