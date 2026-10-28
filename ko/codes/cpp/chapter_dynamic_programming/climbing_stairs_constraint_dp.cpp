/**
 * File: climbing_stairs_constraint_dp.cpp
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 제약 조건이 있는 계단 오르기: 동적 계획법 */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    vector<vector<int>> dp(n + 1, vector<int>(3, 0));
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* 실행 코드 */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    cout << "계단 수: " << n << " 칸, 오르는 방법은 총 " << res << " 가지이다" << endl;

    return 0;
}
