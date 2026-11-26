/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 0-1 배낭: 완전 탐색 */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if (i === 0 || c === 0) {
        return 0;
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 큰 가치를 반환한다
    return Math.max(no, yes);
}

/* 0-1 배낭: 메모이제이션 탐색 */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if (i === 0 || c === 0) {
        return 0;
    }
    // 기록이 있으면 바로 반환한다
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 큰 가치를 기록하고 반환한다
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* 0-1 배낭: 동적 계획법 */
function knapsackDP(
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
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 배낭: 공간 최적화 동적 계획법 */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // dp 테이블 초기화
    const dp = Array(cap + 1).fill(0);
    // 상태 전이
    for (let i = 1; i <= n; i++) {
        // 역순으로 순회
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 실행 예제 */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// 완전 탐색
let res = knapsackDFS(wgt, val, n, cap);
console.log(`배낭 용량 내에서 얻는 최대 가치: ${res}`);

// 메모이제이션 탐색
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`배낭 용량 내에서 얻는 최대 가치: ${res}`);

// 동적 계획법
res = knapsackDP(wgt, val, cap);
console.log(`배낭 용량 내에서 얻는 최대 가치: ${res}`);

// 공간 최적화 동적 계획법
res = knapsackDPComp(wgt, val, cap);
console.log(`배낭 용량 내에서 얻는 최대 가치: ${res}`);

export {};
