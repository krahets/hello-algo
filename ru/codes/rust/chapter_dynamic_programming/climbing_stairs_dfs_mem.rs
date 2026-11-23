/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск с мемоизацией */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // dp[1] и dp[2] уже известны, вернуть их
    if i == 1 || i == 2 {
        return i as i32;
    }
    // Если запись dp[i] существует, сразу вернуть ее
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Сохранить dp[i]
    mem[i] = count;
    count
}

/* Подъем по лестнице: поиск с мемоизацией */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("Количество способов подняться по лестнице из {n} ступеней = {res}");
}
