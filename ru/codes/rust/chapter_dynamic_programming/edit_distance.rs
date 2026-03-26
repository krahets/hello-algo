/*
 * File: edit_distance.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Редакционное расстояние: полный перебор */
fn edit_distance_dfs(s: &str, t: &str, i: usize, j: usize) -> i32 {
    // Если строки s и t обе пусты, вернуть 0
    if i == 0 && j == 0 {
        return 0;
    }
    // Если строка s пуста, вернуть длину t
    if i == 0 {
        return j as i32;
    }
    // Если строка t пуста, вернуть длину s
    if j == 0 {
        return i as i32;
    }
    // Если два символа равны, просто пропустить их
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs(s, t, i - 1, j - 1);
    }
    // Минимальное число правок = минимум из вставки, удаления и замены + 1
    let insert = edit_distance_dfs(s, t, i, j - 1);
    let delete = edit_distance_dfs(s, t, i - 1, j);
    let replace = edit_distance_dfs(s, t, i - 1, j - 1);
    // Вернуть минимальное число операций редактирования
    std::cmp::min(std::cmp::min(insert, delete), replace) + 1
}

/* Редакционное расстояние: поиск с мемоизацией */
fn edit_distance_dfs_mem(s: &str, t: &str, mem: &mut Vec<Vec<i32>>, i: usize, j: usize) -> i32 {
    // Если строки s и t обе пусты, вернуть 0
    if i == 0 && j == 0 {
        return 0;
    }
    // Если строка s пуста, вернуть длину t
    if i == 0 {
        return j as i32;
    }
    // Если строка t пуста, вернуть длину s
    if j == 0 {
        return i as i32;
    }
    // Если запись уже существует, сразу вернуть ее
    if mem[i][j] != -1 {
        return mem[i][j];
    }
    // Если два символа равны, просто пропустить их
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    }
    // Минимальное число правок = минимум из вставки, удаления и замены + 1
    let insert = edit_distance_dfs_mem(s, t, mem, i, j - 1);
    let delete = edit_distance_dfs_mem(s, t, mem, i - 1, j);
    let replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    // Сохранить и вернуть минимальное число операций редактирования
    mem[i][j] = std::cmp::min(std::cmp::min(insert, delete), replace) + 1;
    mem[i][j]
}

/* Редакционное расстояние: динамическое программирование */
fn edit_distance_dp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![vec![0; m + 1]; n + 1];
    // Переход состояния: первая строка и первый столбец
    for i in 1..=n {
        dp[i][0] = i as i32;
    }
    for j in 1..m {
        dp[0][j] = j as i32;
    }
    // Переход состояния: остальные строки и столбцы
    for i in 1..=n {
        for j in 1..=m {
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // Если два символа равны, просто пропустить их
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Минимальное число правок = минимум из вставки, удаления и замены + 1
                dp[i][j] =
                    std::cmp::min(std::cmp::min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    dp[n][m]
}

/* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![0; m + 1];
    // Переход состояния: первая строка
    for j in 1..m {
        dp[j] = j as i32;
    }
    // Переход состояния: остальные строки
    for i in 1..=n {
        // Переход состояния: первый столбец
        let mut leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
        dp[0] = i as i32;
        // Переход состояния: остальные столбцы
        for j in 1..=m {
            let temp = dp[j];
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // Если два символа равны, просто пропустить их
                dp[j] = leftup;
            } else {
                // Минимальное число правок = минимум из вставки, удаления и замены + 1
                dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Обновить до значения dp[i-1, j-1] для следующей итерации
        }
    }
    dp[m]
}

/* Driver Code */
pub fn main() {
    let s = "bag";
    let t = "pack";
    let (n, m) = (s.len(), t.len());

    // Полный перебор
    let res = edit_distance_dfs(s, t, n, m);
    println!("Чтобы изменить {s} на {t}, требуется минимум {res} шагов редактирования");

    // Поиск с мемоизацией
    let mut mem = vec![vec![0; m + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = edit_distance_dfs_mem(s, t, &mut mem, n, m);
    println!("Чтобы изменить {s} на {t}, требуется минимум {res} шагов редактирования");

    // Динамическое программирование
    let res = edit_distance_dp(s, t);
    println!("Чтобы изменить {s} на {t}, требуется минимум {res} шагов редактирования");

    // Динамическое программирование с оптимизацией по памяти
    let res = edit_distance_dp_comp(s, t);
    println!("Чтобы изменить {s} на {t}, требуется минимум {res} шагов редактирования");
}
