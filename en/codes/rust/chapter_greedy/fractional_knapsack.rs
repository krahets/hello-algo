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

/* Fractional knapsack: greedy algorithm */
fn fractional_knapsack(wgt: &[i32], val: &[i32], mut cap: i32) -> f64 {
    // Create a list of items, each with two attributes: weight and value
    let mut items = wgt
        .iter()
        .zip(val.iter())
        .map(|(&w, &v)| Item::new(w, v))
        .collect::<Vec<Item>>();
    // Sort by value per unit weight, item.v / item.w, in descending order
    items.sort_by(|a, b| {
        (b.v as f64 / b.w as f64)
            .partial_cmp(&(a.v as f64 / a.w as f64))
            .unwrap()
    });
    // Repeatedly make greedy choices
    let mut res = 0.0;
    for item in &items {
        if item.w <= cap {
            // If enough capacity remains, put the entire current item in the knapsack
            res += item.v as f64;
            cap -= item.w;
        } else {
            // If the remaining capacity is insufficient, put part of the current item in the knapsack
            res += item.v as f64 / item.w as f64 * cap as f64;
            // No capacity remains, so exit the loop
            break;
        }
    }
    res
}

/* Driver code */
fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap = 50;

    // Greedy algorithm
    let res = fractional_knapsack(&wgt, &val, cap);
    println!("Maximum total item value within the knapsack capacity: {}", res);
}
