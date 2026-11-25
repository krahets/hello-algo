/**
 * File: coin_change_ii.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 동전 교환 II: 동적 계획법 */
function coinChangeIIDP(coins, amt) {
    const n = coins.length;
    // dp 테이블 초기화
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 첫 열 초기화
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
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
function coinChangeIIDPComp(coins, amt) {
    const n = coins.length;
    // dp 테이블 초기화
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
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
const coins = [1, 2, 5];
const amt = 5;

// 동적 계획법
let res = coinChangeIIDP(coins, amt);
console.log(`목표 금액을 만드는 동전 조합 수: ${res}`);

// 공간 최적화 동적 계획법
res = coinChangeIIDPComp(coins, amt);
console.log(`목표 금액을 만드는 동전 조합 수: ${res}`);
