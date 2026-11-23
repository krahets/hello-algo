/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Размен монет II: динамическое программирование */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Инициализация таблицы dp
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // Инициализация первого столбца
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // Переход состояний
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Инициализация таблицы dp
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // Переход состояний
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* Driver Code */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // Динамическое программирование
    let res = coin_change_ii_dp(&coins, amt);
    println!("Количество комбинаций монет для набора целевой суммы = {res}");

    // Динамическое программирование с оптимизацией памяти
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("Количество комбинаций монет для набора целевой суммы = {res}");
}
