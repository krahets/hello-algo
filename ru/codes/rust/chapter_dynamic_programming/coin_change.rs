/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Размен монет: динамическое программирование */
fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Инициализация таблицы dp
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // Переход состояний: первая строка и первый столбец
    for a in 1..=amt {
        dp[0][a] = max;
    }
    // Переход состояний: остальные строки и столбцы
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = std::cmp::min(dp[i - 1][a], dp[i][a - coins[i - 1] as usize] + 1);
            }
        }
    }
    if dp[n][amt] != max {
        return dp[n][amt] as i32;
    } else {
        -1
    }
}

/* Размен монет: динамическое программирование с оптимизацией памяти */
fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Инициализация таблицы dp
    let mut dp = vec![0; amt + 1];
    dp.fill(max);
    dp[0] = 0;
    // Переход состояний
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[a] = std::cmp::min(dp[a], dp[a - coins[i - 1] as usize] + 1);
            }
        }
    }
    if dp[amt] != max {
        return dp[amt] as i32;
    } else {
        -1
    }
}

/* Driver Code */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 4;

    // Динамическое программирование
    let res = coin_change_dp(&coins, amt);
    println!("Минимальное число монет для набора целевой суммы = {res}");

    // Динамическое программирование с оптимизацией памяти
    let res = coin_change_dp_comp(&coins, amt);
    println!("Минимальное число монет для набора целевой суммы = {res}");
}
