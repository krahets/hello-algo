/**
 * File: iteration.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for 문 */
function forLoop(n) {
    let res = 0;
    // 1, 2, ..., n-1, n을 차례로 더한다
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 문 */
function whileLoop(n) {
    let res = 0;
    let i = 1; // 반복 조건에 쓰는 변수를 초기화한다
    // 1, 2, ..., n-1, n을 차례로 더한다
    while (i <= n) {
        res += i;
        i++; // 반복 조건에 쓰는 변수를 갱신한다
    }
    return res;
}

/* while 문(한 번에 두 번 갱신) */
function whileLoopII(n) {
    let res = 0;
    let i = 1; // 반복 조건에 쓰는 변수를 초기화한다
    // 1, 4, 10, ...을 차례로 더한다
    while (i <= n) {
        res += i;
        // 반복 조건에 쓰는 변수를 갱신한다
        i++;
        i *= 2;
    }
    return res;
}

/* 이중 for 문 */
function nestedForLoop(n) {
    let res = '';
    // i = 1, 2, ..., n-1, n에 대해 반복한다
    for (let i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n에 대해 반복한다
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* 실행 예제 */
const n = 5;
let res;

res = forLoop(n);
console.log(`for 문의 합 res = ${res}`);

res = whileLoop(n);
console.log(`while 문의 합 res = ${res}`);

res = whileLoopII(n);
console.log(`while 문(두 번 갱신)의 합 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`이중 for 문의 순회 결과: ${resStr}`);
