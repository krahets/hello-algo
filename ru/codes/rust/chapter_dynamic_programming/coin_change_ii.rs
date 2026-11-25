/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Размен монет II: динамическое программирование */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Инициализировать таблицу dp
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // Инициализировать первый столбец
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // Переход между состояниями
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Сложить число комбинаций без монеты i и с ней
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* Размен монет II: динамическое программирование с экономией памяти */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Инициализировать таблицу dp
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // Переход между состояниями
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[a] = dp[a];
            } else {
                // Сложить число комбинаций без монеты i и с ней
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* Основная программа */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // Динамическое программирование
    let res = coin_change_ii_dp(&coins, amt);
    println!("Число комбинаций монет для заданной суммы: {res}");

    // Динамическое программирование с экономией памяти
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("Число комбинаций монет для заданной суммы: {res}");
}
