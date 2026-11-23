/**
 * File: unbounded_knapsack.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 무한 배낭: 동적 계획법 */
function unboundedKnapsackDP(wgt, val, cap) {
    const n = wgt.length;
    // dp 테이블을 초기화한다
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c];
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 무한 배낭: 공간을 최적화한 동적 계획법 */
function unboundedKnapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // dp 테이블을 초기화한다
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[c] = dp[c];
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 실행 코드 */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// 동적 계획법
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`배낭 용량을 초과하지 않는 물건의 최대 가치는 ${res}이다`);

// 공간을 최적화한 동적 계획법
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`배낭 용량을 초과하지 않는 물건의 최대 가치는 ${res}이다`);
