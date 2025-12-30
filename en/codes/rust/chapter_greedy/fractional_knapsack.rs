/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Item */
struct Item {
    w: i32, // Item weight
    v: i32, // Item value
}

impl Item {
    fn new(w: i32, v: i32) -> Self {
        Self { w, v }
    }
}

/* Fractional knapsack: Greedy algorithm */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // Create item list with two attributes: weight, value
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // Sort by unit value item.v / item.w from high to low
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // Loop for greedy selection
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // If remaining capacity is sufficient, put the entire current item into the knapsack
            res += item.v as f64;
            cap -= item.w;
        } else {
            // If remaining capacity is insufficient, put part of the current item into the knapsack
            res += item.v as f64 / item.w as f64 * cap as f64;
            // No remaining capacity, so break out of the loop
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

    // Greedy algorithm
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("Maximum item value not exceeding knapsack capacity is {}", res);
}
