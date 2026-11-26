/**
 * File: climbing_stairs_dp.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 계단 오르기: 동적 계획법 */
function climbingStairsDP(n: number): number {
    if (n === 1 || n === 2) return n;
    // 부분 문제의 해를 저장할 dp 테이블 초기화
    const dp = new Array(n + 1).fill(-1);
    // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1] = 1;
    dp[2] = 2;
    // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 계단 오르기: 공간 최적화 동적 계획법 */
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

/* 실행 예제 */
const n = 9;
let res = climbingStairsDP(n);
console.log(`계단 ${n}개를 오르는 방법은 ${res}가지`);
res = climbingStairsDPComp(n);
console.log(`계단 ${n}개를 오르는 방법은 ${res}가지`);

export {};
