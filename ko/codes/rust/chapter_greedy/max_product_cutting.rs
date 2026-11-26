/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 탐욕 알고리즘으로 정수 분할의 최대 곱 구하기 */
fn max_product_cutting(n: i32) -> i32 {
    // n <= 3이면 반드시 1을 하나 떼어 낸다
    if n <= 3 {
        return 1 * (n - 1);
    }
    // 탐욕적으로 3씩 떼어 낸다. a는 3의 개수이고 b는 나머지이다
    let a = n / 3;
    let b = n % 3;
    if b == 1 {
        // 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
        3_i32.pow(a as u32 - 1) * 2 * 2
    } else if b == 2 {
        // 나머지가 2이면 그대로 둔다
        3_i32.pow(a as u32) * 2
    } else {
        // 나머지가 0이면 그대로 둔다
        3_i32.pow(a as u32)
    }
}

/* 실행 예제 */
fn main() {
    let n = 58;

    // 탐욕 알고리즘
    let res = max_product_cutting(n);
    println!("분할한 수들의 최대 곱: {}", res);
}
