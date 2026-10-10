/*
 * File: fast_power.rs
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

/* 高速べき乗 */
fn fast_pow(x: i32, n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let half = fast_pow(x, n / 2);
    if n % 2 == 0 {
        return half * half;
    }
    half * half * x
}

fn main() {
    assert_eq!(fast_pow(7, 0), 1);
    assert_eq!(fast_pow(3, 5), 243);
    assert_eq!(fast_pow(2, 6), 64);
}
