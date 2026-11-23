/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* 品物 */
struct Item {
    w: i32, // 品物の重さ
    v: i32, // 品物の価値
}

impl Item {
    fn new(w: i32, v: i32) -> Self {
        Self { w, v }
    }
}

/* 分割可能ナップサック問題：貪欲法 */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // 重さと価値の 2 つの属性を持つ品物のリストを作成する
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // 単位重さ当たりの価値 item.v / item.w の降順にソートする
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // 貪欲な選択を繰り返す
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v as f64;
            cap -= item.w;
        } else {
            // 残り容量が不足している場合、現在の品物の一部をナップサックに入れる
            res += item.v as f64 / item.w as f64 * cap as f64;
            // 残り容量がないため、ループを終了する
            break;
        }
    }
    res
}

/* 実行用コード */
fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap = 50;

    // 貪欲アルゴリズム
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("ナップサックの容量を超えない品物の最大価値は {}", res);
}
