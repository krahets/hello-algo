/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 재귀 */
int recur(int n) {
    // 종료 조건
    if (n == 1)
        return 1;
    // 내려가기: 재귀 호출
    int res = recur(n - 1);
    // 돌아오기: 결과 반환
    return n + res;
}

/* 반복으로 재귀 구현 */
int forLoopRecur(int n) {
    int stack[1000]; // 큰 배열을 사용하여 스택을 구현한다
    int top = -1;    // 스택의 맨 위 인덱스
    int res = 0;
    // 내려가기: 재귀 호출
    for (int i = n; i > 0; i--) {
        // 스택에 삽입하여 내려가는 과정을 모방한다
        stack[1 + top++] = i;
    }
    // 돌아오기: 결과 반환
    while (top >= 0) {
        // 스택에서 꺼내어 돌아오는 과정을 모방한다
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* 꼬리 재귀 */
int tailRecur(int n, int res) {
    // 종료 조건
    if (n == 0)
        return res;
    // 꼬리 재귀 호출
    return tailRecur(n - 1, res + n);
}

/* 피보나치 수열: 재귀 */
int fib(int n) {
    // 종료 조건 f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // 재귀 호출 f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // 결과 f(n)을 반환한다
    return res;
}

/* 실행 코드 */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\n재귀 함수로 구한 합 res = %d\n", res);

    res = forLoopRecur(n);
    printf("\n반복으로 재귀를 구현하여 구한 합 res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\n꼬리 재귀 함수로 구한 합 res = %d\n", res);

    res = fib(n);
    printf("\n피보나치 수열의 %d번째 항은 %d이다\n", n, res);

    return 0;
}
