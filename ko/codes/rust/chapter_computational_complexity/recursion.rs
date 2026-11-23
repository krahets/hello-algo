/*
 * File: recursion.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* 재귀 */
fn recur(n: i32) -> i32 {
    // 종료 조건
    if n == 1 {
        return 1;
    }
    // 내려가기: 재귀 호출
    let res = recur(n - 1);
    // 돌아오기: 결과 반환
    n + res
}

/* 반복으로 재귀 구현 */
fn for_loop_recur(n: i32) -> i32 {
    // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
    let mut stack = Vec::new();
    let mut res = 0;
    // 내려가기: 재귀 호출
    for i in (1..=n).rev() {
        // 스택에 삽입하여 내려가는 과정을 모방한다
        stack.push(i);
    }
    // 돌아오기: 결과 반환
    while !stack.is_empty() {
        // 스택에서 꺼내어 돌아오는 과정을 모방한다
        res += stack.pop().unwrap();
    }
    // res = 1+2+3+...+n
    res
}

/* 꼬리 재귀 */
fn tail_recur(n: i32, res: i32) -> i32 {
    // 종료 조건
    if n == 0 {
        return res;
    }
    // 꼬리 재귀 호출
    tail_recur(n - 1, res + n)
}

/* 피보나치 수열: 재귀 */
fn fib(n: i32) -> i32 {
    // 종료 조건 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1;
    }
    // 재귀 호출 f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2);
    // 결과를 반환한다
    res
}

/* 실행 코드 */
fn main() {
    let n = 5;
    let mut res;

    res = recur(n);
    println!("\n재귀 함수로 구한 합 res = {res}");

    res = for_loop_recur(n);
    println!("\n반복으로 재귀를 구현하여 구한 합 res = {res}");

    res = tail_recur(n, 0);
    println!("\n꼬리 재귀 함수로 구한 합 res = {res}");

    res = fib(n);
    println!("\n피보나치 수열의 {n}번째 항은 {res}이다");
}
