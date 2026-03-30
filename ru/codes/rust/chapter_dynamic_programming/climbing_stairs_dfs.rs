/*
 * File: climbing_stairs_dfs.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск */
fn dfs(i: usize) -> i32 {
    // dp[1] и dp[2] уже известны, вернуть их
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1) + dfs(i - 2);
    count
}

/* Подъем по лестнице: поиск */
fn climbing_stairs_dfs(n: usize) -> i32 {
    dfs(n)
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs(n);
    println!("Количество способов подняться по лестнице из {n} ступеней = {res}");
}
