/**
 * File: iteration.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for 반복문 */
function forLoop(n) {
    let res = 0;
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 반복문 */
function whileLoop(n) {
    let res = 0;
    let i = 1; // 조건 변수를 초기화한다
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    while (i <= n) {
        res += i;
        i++; // 조건 변수를 갱신한다
    }
    return res;
}

/* while 반복문(두 번 갱신) */
function whileLoopII(n) {
    let res = 0;
    let i = 1; // 조건 변수를 초기화한다
    // 반복문으로 1, 4, 10, ...의 합을 구한다
    while (i <= n) {
        res += i;
        // 조건 변수를 갱신한다
        i++;
        i *= 2;
    }
    return res;
}

/* 이중 for 반복문 */
function nestedForLoop(n) {
    let res = '';
    // i = 1, 2, ..., n-1, n을 반복한다
    for (let i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n을 반복한다
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* 실행 코드 */
const n = 5;
let res;

res = forLoop(n);
console.log(`for 반복문으로 구한 합 res = ${res}`);

res = whileLoop(n);
console.log(`while 반복문으로 구한 합 res = ${res}`);

res = whileLoopII(n);
console.log(`while 반복문(두 번 갱신)으로 구한 합 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`이중 for 반복문의 순회 결과 ${resStr}`);
