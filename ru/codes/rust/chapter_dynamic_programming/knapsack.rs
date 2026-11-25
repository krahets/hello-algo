/*
 * File: knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Рюкзак 0–1: полный перебор */
fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0;
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    let no = knapsack_dfs(wgt, val, i - 1, c);
    let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Вернуть большую из двух стоимостей
    std::cmp::max(no, yes)
}

/* Рюкзак 0–1: поиск с мемоизацией */
fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0;
    }
    // Если результат сохранён, сразу вернуть его
    if mem[i][c] != -1 {
        return mem[i][c];
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Сохранить и вернуть большую из двух стоимостей
    mem[i][c] = std::cmp::max(no, yes);
    mem[i][c]
}

/* Рюкзак 0–1: динамическое программирование */
fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализировать таблицу dp
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // Переход между состояниями
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = std::cmp::max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                );
            }
        }
    }
    dp[n][cap]
}

/* Рюкзак 0–1: динамическое программирование с экономией памяти */
fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Инициализировать таблицу dp
    let mut dp = vec![0; cap + 1];
    // Переход между состояниями
    for i in 1..=n {
        // Обход в обратном порядке
        for c in (1..=cap).rev() {
            if wgt[i - 1] <= c as i32 {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Основная программа */
pub fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap: usize = 50;
    let n = wgt.len();

    // Полный перебор
    let res = knapsack_dfs(&wgt, &val, n, cap);
    println!("Максимальная стоимость предметов, помещающихся в рюкзак: {res}");

    // Поиск с мемоизацией
    let mut mem = vec![vec![0; cap + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = knapsack_dfs_mem(&wgt, &val, &mut mem, n, cap);
    println!("Максимальная стоимость предметов, помещающихся в рюкзак: {res}");

    // Динамическое программирование
    let res = knapsack_dp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов, помещающихся в рюкзак: {res}");

    // Динамическое программирование с экономией памяти
    let res = knapsack_dp_comp(&wgt, &val, cap);
    println!("Максимальная стоимость предметов, помещающихся в рюкзак: {res}");
}
