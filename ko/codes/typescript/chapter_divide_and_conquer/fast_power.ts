/**
 * File: fast_power.ts
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

/* 빠른 거듭제곱 */
function fastPow(x: number, n: number): number {
    if (n === 0) {
        return 1;
    }
    const half = fastPow(x, Math.floor(n / 2));
    if (n % 2 === 0) {
        return half * half;
    }
    return half * half * x;
}

if (fastPow(7, 0) !== 1 || fastPow(3, 5) !== 243 || fastPow(2, 6) !== 64) {
    throw new Error('빠른 거듭제곱 검증에 실패했다');
}

export {};
