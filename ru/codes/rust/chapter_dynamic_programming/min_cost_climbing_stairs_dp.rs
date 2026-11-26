/*
 * File: min_cost_climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* Минимальная стоимость подъёма: динамическое программирование */
fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    }
    // Создать таблицу dp для решений подзадач
    let mut dp = vec![-1; n + 1];
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Переход: решать подзадачи от меньших к большим
    for i in 3..=n {
        dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    dp[n]
}

/* Минимальная стоимость подъёма: динамическое программирование с экономией памяти */
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

/* Основная программа */
pub fn main() {
    let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
    println!("Стоимость ступеней: {:?}", &cost);

    let res = min_cost_climbing_stairs_dp(&cost);
    println!("Минимальная стоимость подъёма: {res}");

    let res = min_cost_climbing_stairs_dp_comp(&cost);
    println!("Минимальная стоимость подъёма: {res}");
}
