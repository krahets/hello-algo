/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 物品 */
struct Item {
    w: i32, // 物品重量
    v: i32, // 物品价值
}

impl Item {
    fn new(w: i32, v: i32) -> Self {
        Self { w, v }
    }
}

/* 分数背包：贪心 */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // 创建物品列表，包含两个属性：重量、价值
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // 按照单位价值 item.v / item.w 从高到低进行排序
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // 循环贪心选择
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // 若剩余容量充足，则将当前物品整个装进背包
            res += item.v as f64;
            cap -= item.w;
        } else {
            // 若剩余容量不足，则将当前物品的一部分装进背包
            res += item.v as f64 / item.w as f64 * cap as f64;
            // 已无剩余容量，因此跳出循环
            break;
        }
    }
    res
}

/* Driver Code */
fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap = 50;

    // 贪心算法
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("不超过背包容量的最大物品价值为 {}", res);
}
