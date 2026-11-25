/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for 문 */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // 1, 2, ..., n-1, n을 차례로 더한다
    for i in 1..=n {
        res += i;
    }
    res
}

/* while 문 */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 반복 조건에 쓰는 변수를 초기화한다

    // 1, 2, ..., n-1, n을 차례로 더한다
    while i <= n {
        res += i;
        i += 1; // 반복 조건에 쓰는 변수를 갱신한다
    }
    res
}

/* while 문(한 번에 두 번 갱신) */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 반복 조건에 쓰는 변수를 초기화한다

    // 1, 4, 10, ...을 차례로 더한다
    while i <= n {
        res += i;
        // 반복 조건에 쓰는 변수를 갱신한다
        i += 1;
        i *= 2;
    }
    res
}

/* 이중 for 문 */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // i = 1, 2, ..., n-1, n에 대해 반복한다
    for i in 1..=n {
        // j = 1, 2, ..., n-1, n에 대해 반복한다
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* 실행 예제 */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nfor 문의 합 res = {res}");

    res = while_loop(n);
    println!("\nwhile 문의 합 res = {res}");

    res = while_loop_ii(n);
    println!("\nwhile 문(두 번 갱신)의 합 res = {}", res);

    let res = nested_for_loop(n);
    println!("\n이중 for 문의 순회 결과: {res}");
}
