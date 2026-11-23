/**
 * File: coin_change.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 동전 교환: 동적 계획법 */
function coinChangeDP(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // dp 테이블을 초기화한다
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: amt + 1 }, () => 0)
    );
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for (let a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 상태 전이: 나머지 행과 열
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] !== MAX ? dp[n][amt] : -1;
}

/* 동전 교환: 공간을 최적화한 동적 계획법 */
function coinChangeDPComp(coins, amt) {
    const n = coins.length;
    const MAX = amt + 1;
    // dp 테이블을 초기화한다
    const dp = Array.from({ length: amt + 1 }, () => MAX);
    dp[0] = 0;
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] !== MAX ? dp[amt] : -1;
}

/* 실행 코드 */
const coins = [1, 2, 5];
const amt = 4;

// 동적 계획법
let res = coinChangeDP(coins, amt);
console.log(`목표 금액을 만드는 데 필요한 최소 동전 개수는 ${res}개이다`);

// 공간을 최적화한 동적 계획법
res = coinChangeDPComp(coins, amt);
console.log(`목표 금액을 만드는 데 필요한 최소 동전 개수는 ${res}개이다`);
