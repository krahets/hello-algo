/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Поиск с мемоизацией */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // Для dp[1] и dp[2] вернуть известные значения
    if i == 1 || i == 2 {
        return i as i32;
    }
    // Если dp[i] уже вычислено, вернуть сохранённое значение
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Сохранить dp[i]
    mem[i] = count;
    count
}

/* Подъём по лестнице: поиск с мемоизацией */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i] хранит число способов достичь ступени i, а -1 означает отсутствие записи
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* Основная программа */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("Число способов подняться на лестницу из {n} ступеней: {res}.");
}
