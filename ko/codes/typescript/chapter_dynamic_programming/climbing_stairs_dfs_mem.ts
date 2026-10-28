/**
 * File: climbing_stairs_dfs_mem.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 메모이제이션을 이용한 탐색 */
function dfs(i: number, mem: number[]): number {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i === 1 || i === 2) return i;
    // dp[i]의 기록이 있으면 해당 값을 바로 반환한다
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i]를 기록한다
    mem[i] = count;
    return count;
}

/* 계단 오르기: 메모이제이션을 이용한 탐색 */
function climbingStairsDFSMem(n: number): number {
    // mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* 실행 코드 */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`${n}개의 계단을 오르는 방법은 총 ${res}가지이다`);

export {};
