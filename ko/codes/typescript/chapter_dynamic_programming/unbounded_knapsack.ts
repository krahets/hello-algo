/**
 * File: unbounded_knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 무한 배낭: 동적 계획법 */
function unboundedKnapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // dp 테이블 초기화
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c];
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 무한 배낭: 공간 최적화 동적 계획법 */
function unboundedKnapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // dp 테이블 초기화
    const dp = Array.from({ length: cap + 1 }, () => 0);
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[c] = dp[c];
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 실행 예제 */
const wgt = [1, 2, 3];
const val = [5, 11, 15];
const cap = 4;

// 동적 계획법
let res = unboundedKnapsackDP(wgt, val, cap);
console.log(`배낭 용량 내에서 얻는 최대 가치: ${res}`);

// 공간 최적화 동적 계획법
res = unboundedKnapsackDPComp(wgt, val, cap);
console.log(`배낭 용량 내에서 얻는 최대 가치: ${res}`);

export {};
