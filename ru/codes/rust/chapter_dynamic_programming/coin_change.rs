/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Размен монет: динамическое программирование */
fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Инициализировать таблицу dp
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // Переход: первая строка и первый столбец
    for a in 1..=amt {
        dp[0][a] = max;
    }
    // Переход: остальные строки и столбцы
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
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

/* Размен монет: динамическое программирование с экономией памяти */
fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Инициализировать таблицу dp
    let mut dp = vec![0; amt + 1];
    dp.fill(max);
    dp[0] = 0;
    // Переход между состояниями
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[a] = dp[a];
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
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

/* Основная программа */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 4;

    // Динамическое программирование
    let res = coin_change_dp(&coins, amt);
    println!("Минимальное число монет для заданной суммы: {res}");

    // Динамическое программирование с экономией памяти
    let res = coin_change_dp_comp(&coins, amt);
    println!("Минимальное число монет для заданной суммы: {res}");
}
