/*
 * File: climbing_stairs_dfs.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск */
fn dfs(i: usize) -> i32 {
    // Для dp[1] и dp[2] вернуть известные значения
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1) + dfs(i - 2);
    count
}

/* Подъём по лестнице: поиск */
fn climbing_stairs_dfs(n: usize) -> i32 {
    dfs(n)
}

/* Основная программа */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs(n);
    println!("Число способов подняться на лестницу из {n} ступеней: {res}.");
}
