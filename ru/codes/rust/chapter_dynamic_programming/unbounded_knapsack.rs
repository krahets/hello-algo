/*
 * File: unbounded_knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Полный рюкзак: динамическое программирование */
fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализация таблицы dp
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // Переход состояний
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Полный рюкзак: динамическое программирование с оптимизацией памяти */
fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализация таблицы dp
    let mut dp = vec![0; cap + 1];
    // Переход состояний
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[c] = dp[c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Driver Code */
pub fn main() {
    let wgt = [1, 2, 3];
    let val = [5, 11, 15];
    let cap: usize = 4;

    // Динамическое программирование
    let res = unbounded_knapsack_dp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов без превышения вместимости рюкзака = {res}");

    // Динамическое программирование с оптимизацией памяти
    let res = unbounded_knapsack_dp_comp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов без превышения вместимости рюкзака = {res}");
}
