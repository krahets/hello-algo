/**
 * File: climbing_stairs_dfs.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 탐색 */
function dfs(i: number): number {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i === 1 || i === 2) return i;
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 계단 오르기: 탐색 */
function climbingStairsDFS(n: number): number {
    return dfs(n);
}

/* 실행 코드 */
const n = 9;
const res = climbingStairsDFS(n);
console.log(`${n}개의 계단을 오르는 방법은 총 ${res}가지이다`);

export {};
