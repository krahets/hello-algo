/*
 * File: unbounded_knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Неограниченный рюкзак: динамическое программирование */
fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализировать таблицу dp
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // Переход между состояниями
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Неограниченный рюкзак: динамическое программирование с экономией памяти */
fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализировать таблицу dp
    let mut dp = vec![0; cap + 1];
    // Переход между состояниями
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[c] = dp[c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Основная программа */
pub fn main() {
    let wgt = [1, 2, 3];
    let val = [5, 11, 15];
    let cap: usize = 4;

    // Динамическое программирование
    let res = unbounded_knapsack_dp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов, помещающихся в рюкзак: {res}");

    // Динамическое программирование с экономией памяти
    let res = unbounded_knapsack_dp_comp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов, помещающихся в рюкзак: {res}");
}
