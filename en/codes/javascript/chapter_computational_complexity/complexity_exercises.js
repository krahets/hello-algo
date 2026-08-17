/**
 * File: complexity_exercises.js
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

/* Iterative summation */
function sumIter(n) {
    let res = 0;
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* Recursive summation */
function sumRecur(n) {
    if (n === 1) {
        return 1;
    }
    return n + sumRecur(n - 1);
}

/* Linear loop */
function linearLoop(n) {
    let res = 0;
    for (let i = 0; i < n; i++) {
        res += i;
    }
    return res;
}

/* Quadratic loop */
function quadraticLoop(n) {
    let res = 0;
    for (let i = 0; i < n; i++) {
        for (let j = i; j < n; j++) {
            res += j;
        }
    }
    return res;
}

/* Logarithmic loop */
function logarithmicLoop(n) {
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
    throw new Error('complexity exercise check failed');
}
