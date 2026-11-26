/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Подъём по лестнице: динамическое программирование */
fn climbing_stairs_dp(n: usize) -> i32 {
    // Для dp[1] и dp[2] вернуть известные значения
    if n == 1 || n == 2 {
        return n as i32;
    }
    // Создать таблицу dp для решений подзадач
    let mut dp = vec![-1; n + 1];
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход: решать подзадачи от меньших к большим
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* Подъём по лестнице: динамическое программирование с экономией памяти */
fn climbing_stairs_dp_comp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return n as i32;
    }
    let (mut a, mut b) = (1, 2);
    for _ in 3..=n {
        let tmp = b;
        b = a + b;
        a = tmp;
    }
    b
}

/* Основная программа */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dp(n);
    println!("Число способов подняться на лестницу из {n} ступеней: {res}.");

    let res = climbing_stairs_dp_comp(n);
    println!("Число способов подняться на лестницу из {n} ступеней: {res}.");
}
