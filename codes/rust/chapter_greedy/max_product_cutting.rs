/*
 * File: max_product_cutting.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 最大切分乘积：贪心 */
pub fn max_product_cutting(n: u32) -> u32 {
    assert!(n > 0, "n 必须为正整数");

    // 当 n <= 3 时，必须切分出一个 1
    if n <= 3 {
        // n > 0， 不会发生减法溢出
        return n - 1;
    }
    // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
    let a = n / 3;
    let b = n % 3;
    match b {
        // 当余数为 0 时，不做处理
        0 => 3_u32.pow(a),

        // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
        1 => 3_u32.pow(a - 1) * 2 * 2,

        // 当余数为 2 时，不做处理
        2 => 3_u32.pow(a) * 2,

        _ => unreachable!(),
    }
}

/* Driver Code */
fn main() {
    let n = 58;

    // 贪心算法
    let res = max_product_cutting(n);
    println!("最大切分乘积为 {res}");
}
