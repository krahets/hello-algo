/**
 * File: climbing_stairs_dp.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 계단 오르기: 동적 계획법 */
function climbingStairsDP(n: number): number {
    if (n === 1 || n === 2) return n;
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    const dp = new Array(n + 1).fill(-1);
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = 1;
    dp[2] = 2;
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 계단 오르기: 공간을 최적화한 동적 계획법 */
function climbingStairsDPComp(n: number): number {
    if (n === 1 || n === 2) return n;
    let a = 1,
        b = 2;
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* 실행 코드 */
const n = 9;
let res = climbingStairsDP(n);
console.log(`${n}개의 계단을 오르는 방법은 총 ${res}가지이다`);
res = climbingStairsDPComp(n);
console.log(`${n}개의 계단을 오르는 방법은 총 ${res}가지이다`);

export {};
