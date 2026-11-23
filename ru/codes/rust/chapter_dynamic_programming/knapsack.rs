/*
 * File: knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Рюкзак 0-1: полный перебор */
fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0;
    }
    // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    let no = knapsack_dfs(wgt, val, i - 1, c);
    let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Вернуть вариант с большей стоимостью из двух возможных
    std::cmp::max(no, yes)
}

/* Рюкзак 0-1: поиск с мемоизацией */
fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0;
    }
    // Если запись уже есть, вернуть сразу
    if mem[i][c] != -1 {
        return mem[i][c];
    }
    // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Сохранить и вернуть вариант с большей стоимостью из двух решений
    mem[i][c] = std::cmp::max(no, yes);
    mem[i][c]
}

/* Рюкзак 0-1: динамическое программирование */
fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализация таблицы dp
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // Переход состояний
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[i][c] = std::cmp::max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                );
            }
        }
    }
    dp[n][cap]
}

/* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализация таблицы dp
    let mut dp = vec![0; cap + 1];
    // Переход состояний
    for i in 1..=n {
        // Обход в обратном порядке
        for c in (1..=cap).rev() {
            if wgt[i - 1] <= c as i32 {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Driver Code */
pub fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap: usize = 50;
    let n = wgt.len();

    // Полный перебор
    let res = knapsack_dfs(&wgt, &val, n, cap);
    println!("Максимальная стоимость предметов без превышения вместимости рюкзака = {res}");

    // Поиск с запоминанием
    let mut mem = vec![vec![0; cap + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = knapsack_dfs_mem(&wgt, &val, &mut mem, n, cap);
    println!("Максимальная стоимость предметов без превышения вместимости рюкзака = {res}");

    // Динамическое программирование
    let res = knapsack_dp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов без превышения вместимости рюкзака = {res}");

    // Динамическое программирование с оптимизацией памяти
    let res = knapsack_dp_comp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов без превышения вместимости рюкзака = {res}");
}
