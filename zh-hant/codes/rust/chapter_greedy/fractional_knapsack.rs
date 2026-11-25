/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 物品 */
struct Item {
    w: i32, // 物品重量
    v: i32, // 物品價值
}

impl Item {
    fn new(w: i32, v: i32) -> Self {
        Self { w, v }
    }
}

/* 分數背包：貪婪法 */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // 建立物品清單，每件物品有重量與價值兩項屬性
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // 依單位價值 item.v / item.w 由高到低排序
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // 反覆依貪婪策略選取物品
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // 若剩餘容量足夠，就將目前的物品整件裝入背包
            res += item.v as f64;
            cap -= item.w;
        } else {
            // 若剩餘容量不足，就將目前物品的一部分裝入背包
            res += item.v as f64 / item.w as f64 * cap as f64;
            // 背包已滿，跳出迴圈
            break;
        }
    }
    res
}

/* 主程式 */
fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap = 50;

    // 貪婪演算法
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("在背包容量限制內，物品的最大總價值為 {}", res);
}
