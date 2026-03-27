/*
 * File: min_cost_climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* Минимальная стоимость подъема по лестнице: динамическое программирование */
fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    }
    // Инициализация таблицы dp для хранения решений подзадач
    let mut dp = vec![-1; n + 1];
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for i in 3..=n {
        dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    dp[n]
}

/* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
fn min_cost_climbing_stairs_dp_comp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    };
    let (mut a, mut b) = (cost[1], cost[2]);
    for i in 3..=n {
        let tmp = b;
        b = cmp::min(a, tmp) + cost[i];
        a = tmp;
    }
    b
}

/* Driver Code */
pub fn main() {
    let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
    println!("Список стоимостей ступеней = {:?}", &cost);

    let res = min_cost_climbing_stairs_dp(&cost);
    println!("Минимальная стоимость подъема по лестнице = {res}");

    let res = min_cost_climbing_stairs_dp_comp(&cost);
    println!("Минимальная стоимость подъема по лестнице = {res}");
}
