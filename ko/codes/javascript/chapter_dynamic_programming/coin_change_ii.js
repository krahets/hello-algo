/**
 * File: coin_change_ii.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 동전 교환 II: 동적 계획법 */
function coinChangeIIDP(coins, amt) {
    const n = coins.length;
    // dp 테이블을 초기화한다
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 첫 번째 열을 초기화한다
    for (let i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 동전 교환 II: 공간을 최적화한 동적 계획법 */
function coinChangeIIDPComp(coins, amt) {
    const n = coins.length;
    // dp 테이블을 초기화한다
    const dp = Array.from({ length: amt + 1 }, () => 0);
    dp[0] = 1;
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* 실행 코드 */
const coins = [1, 2, 5];
const amt = 5;

// 동적 계획법
let res = coinChangeIIDP(coins, amt);
console.log(`목표 금액을 만드는 동전 조합의 수는 ${res}개이다`);

// 공간을 최적화한 동적 계획법
res = coinChangeIIDPComp(coins, amt);
console.log(`목표 금액을 만드는 동전 조합의 수는 ${res}개이다`);
