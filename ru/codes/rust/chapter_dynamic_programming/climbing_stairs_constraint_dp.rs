/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Подъем по лестнице с ограничениями: динамическое программирование */
fn climbing_stairs_constraint_dp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return 1;
    };
    // Инициализировать таблицу dp для хранения решений подзадач
    let mut dp = vec![vec![-1; 3]; n + 1];
    // Начальное состояние: заранее задать решения для наименьших подзадач
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
    for i in 3..=n {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    dp[n][1] + dp[n][2]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_constraint_dp(n);
    println!("Для подъема по лестнице из {n} ступеней существует {res} способов");
}
