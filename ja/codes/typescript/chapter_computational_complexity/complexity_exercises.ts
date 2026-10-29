/**
 * File: complexity_exercises.ts
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

/* 反復による総和 */
function sumIter(n: number): number {
    let res = 0;
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* 再帰による総和 */
function sumRecur(n: number): number {
    if (n === 1) {
        return 1;
    }
    return n + sumRecur(n - 1);
}

/* 線形オーダーのループ */
function linearLoop(n: number): number {
    let res = 0;
    for (let i = 0; i < n; i++) {
        res += i;
    }
    return res;
}

/* 二次オーダーのループ */
function quadraticLoop(n: number): number {
    let res = 0;
    for (let i = 0; i < n; i++) {
        for (let j = i; j < n; j++) {
            res += j;
        }
    }
    return res;
}

/* 対数オーダーのループ */
function logarithmicLoop(n: number): number {
    while (n > 1) {
        n = Math.floor(n / 2);
    }
    return n;
}

if (
    sumIter(1) !== 1 ||
    sumRecur(1) !== 1 ||
    sumIter(4) !== 10 ||
    sumRecur(4) !== 10 ||
    linearLoop(4) !== 6 ||
    quadraticLoop(4) !== 20 ||
    logarithmicLoop(4) !== 1 ||
    logarithmicLoop(5) !== 1
) {
    throw new Error('計算量の練習問題の検証に失敗しました');
}

export {};
