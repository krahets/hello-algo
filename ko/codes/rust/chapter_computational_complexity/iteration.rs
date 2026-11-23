/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for 반복문 */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    for i in 1..=n {
        res += i;
    }
    res
}

/* while 반복문 */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 조건 변수를 초기화한다

    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    while i <= n {
        res += i;
        i += 1; // 조건 변수를 갱신한다
    }
    res
}

/* while 반복문(두 번 갱신) */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 조건 변수를 초기화한다

    // 반복문으로 1, 4, 10, ...의 합을 구한다
    while i <= n {
        res += i;
        // 조건 변수를 갱신한다
        i += 1;
        i *= 2;
    }
    res
}

/* 이중 for 반복문 */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // i = 1, 2, ..., n-1, n을 반복한다
    for i in 1..=n {
        // j = 1, 2, ..., n-1, n을 반복한다
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* 실행 코드 */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nfor 반복문으로 구한 합 res = {res}");

    res = while_loop(n);
    println!("\nwhile 반복문으로 구한 합 res = {res}");

    res = while_loop_ii(n);
    println!("\nwhile 반복문(두 번 갱신)으로 구한 합 res = {}", res);

    let res = nested_for_loop(n);
    println!("\n이중 for 반복문의 순회 결과 {res}");
}
