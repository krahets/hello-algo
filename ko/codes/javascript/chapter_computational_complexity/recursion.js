/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 재귀 */
function recur(n) {
    // 종료 조건
    if (n === 1) return 1;
    // 내려가는 단계: 재귀 호출
    const res = recur(n - 1);
    // 돌아오는 단계: 결과 반환
    return n + res;
}

/* 반복으로 재귀 구현하기 */
function forLoopRecur(n) {
    // 명시적인 스택으로 시스템 호출 스택을 모방한다
    const stack = [];
    let res = 0;
    // 내려가는 단계: 재귀 호출
    for (let i = n; i > 0; i--) {
        // 스택에 값을 넣어 재귀 호출 단계를 재현한다
        stack.push(i);
    }
    // 돌아오는 단계: 결과 반환
    while (stack.length) {
        // 스택에서 값을 꺼내 반환 단계를 재현한다
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* 꼬리 재귀 */
function tailRecur(n, res) {
    // 종료 조건
    if (n === 0) return res;
    // 꼬리 재귀 호출
    return tailRecur(n - 1, res + n);
}

/* 재귀로 피보나치 수 구하기 */
function fib(n) {
    // 종료 조건: f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // 재귀 호출: f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // 결과 f(n)을 반환한다
    return res;
}

/* 실행 예제 */
const n = 5;
let res;

res = recur(n);
console.log(`재귀 함수로 구한 합 res = ${res}`);

res = forLoopRecur(n);
console.log(`반복으로 재귀를 구현해 구한 합 res = ${res}`);

res = tailRecur(n, 0);
console.log(`꼬리 재귀 함수로 구한 합 res = ${res}`);

res = fib(n);
console.log(`피보나치 수열의 ${n}번째 항 = ${res}`);

