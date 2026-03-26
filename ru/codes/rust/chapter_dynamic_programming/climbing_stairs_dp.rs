/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Подъем по лестнице: динамическое программирование */
fn climbing_stairs_dp(n: usize) -> i32 {
    // Если значения dp[1] и dp[2] уже известны, вернуть их
    if n == 1 || n == 2 {
        return n as i32;
    }
    // Инициализировать таблицу dp для хранения решений подзадач
    let mut dp = vec![-1; n + 1];
    // Начальное состояние: заранее задать решения для наименьших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
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

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dp(n);
    println!("Для подъема по лестнице из {n} ступеней существует {res} способов");

    let res = climbing_stairs_dp_comp(n);
    println!("Для подъема по лестнице из {n} ступеней существует {res} способов");
}
