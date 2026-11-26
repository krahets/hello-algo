/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 동전 교환 II: 동적 계획법 */
int coinChangeIIDP(vector<int> &coins, int amt) {
    int n = coins.size();
    // dp 테이블 초기화
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // 첫 열 초기화
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 넘으면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 동전 교환 II: 공간 최적화 동적 계획법 */
int coinChangeIIDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    // dp 테이블 초기화
    vector<int> dp(amt + 1, 0);
    dp[0] = 1;
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 넘으면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* 실행 예제 */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 5;

    // 동적 계획법
    int res = coinChangeIIDP(coins, amt);
    cout << "목표 금액을 만드는 동전 조합 수: " << res << endl;

    // 공간 최적화 동적 계획법
    res = coinChangeIIDPComp(coins, amt);
    cout << "목표 금액을 만드는 동전 조합 수: " << res << endl;

    return 0;
}
