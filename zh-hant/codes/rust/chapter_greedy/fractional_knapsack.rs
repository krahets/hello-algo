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

/* 分數背包：貪婪 */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // 建立物品串列，包含兩個屬性：重量、價值
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // 按照單位價值 item.v / item.w 從高到低進行排序
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // 迴圈貪婪選擇
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // 若剩餘容量充足，則將當前物品整個裝進背包
            res += item.v as f64;
            cap -= item.w;
        } else {
            // 若剩餘容量不足，則將當前物品的一部分裝進背包
            res += item.v as f64 / item.w as f64 * cap as f64;
            // 已無剩餘容量，因此跳出迴圈
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

    // 貪婪演算法
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("不超過背包容量的最大物品價值為 {}", res);
}
