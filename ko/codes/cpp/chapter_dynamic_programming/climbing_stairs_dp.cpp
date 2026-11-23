/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 계단 오르기: 동적 계획법 */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    vector<int> dp(n + 1);
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = 1;
    dp[2] = 2;
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 계단 오르기: 공간을 최적화한 동적 계획법 */
int climbingStairsDPComp(int n) {
    if (n == 1 || n == 2)
        return n;
    int a = 1, b = 2;
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* 실행 코드 */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    cout << "계단 수: " << n << " 칸, 오르는 방법은 총 " << res << " 가지이다" << endl;

    res = climbingStairsDPComp(n);
    cout << "계단 수: " << n << " 칸, 오르는 방법은 총 " << res << " 가지이다" << endl;

    return 0;
}
