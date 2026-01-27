/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

use std::cmp;

/* 最大容量：贪心 */
pub fn max_capacity(ht: &[u32]) -> u32 {
    // 若数组为空，直接返回 0
    if ht.is_empty() {
        return 0;
    }
    // 初始化 i, j，使其分列数组两端
    let mut i = 0;
    let mut j = ht.len() - 1;
    // 初始最大容量为 0
    let mut res = 0;
    // 循环贪心选择，直至两板相遇
    while i < j {
        // 更新最大容量
        // 选用 u32 而非 usize 是出于语义考虑：usize 用于索引偏移、容器长度、迭代计数等场景；
        // 原则上，涉及一般数学计算时，应该选用通用整数类型。因为宽度和高度均不小于零，此处选用
        // 无符号整数 u32。注意到 64 位平台上 u32 无法覆盖所有 usize 值，此处直接对过大值做
        // 退出处理。
        let width: u32 = (j - i).try_into().expect("宽度过大");
        // 乘法溢出时终止程序
        let cap = cmp::min(ht[i], ht[j]) * width;
        res = cmp::max(res, cap);
        // 向内移动短板
        if ht[i] < ht[j] {
            i += 1;
        } else {
            j -= 1;
        }
    }
    res
}

/* Driver Code */
fn main() {
    let ht = [3, 8, 5, 2, 7, 7, 3, 4];

    // 贪心算法
    let res = max_capacity(&ht);
    println!("最大容量为 {res}");
}
