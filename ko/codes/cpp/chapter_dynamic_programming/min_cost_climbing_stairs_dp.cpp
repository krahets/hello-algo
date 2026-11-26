/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 계단 오르기의 최소 비용: 동적 계획법 */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // 부분 문제의 해를 저장할 dp 테이블 초기화
    vector<int> dp(n + 1);
    // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 계단 오르기의 최소 비용: 공간 최적화 동적 계획법 */
int minCostClimbingStairsDPComp(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* 실행 예제 */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "입력한 계단별 비용 목록: ";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "계단을 모두 오르는 최소 비용: " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "계단을 모두 오르는 최소 비용: " << res << endl;

    return 0;
}
