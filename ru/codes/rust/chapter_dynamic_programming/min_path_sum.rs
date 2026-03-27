/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Минимальная сумма пути: полный перебор */
fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // Если это верхняя левая ячейка, завершить поиск
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    let up = min_path_sum_dfs(grid, i - 1, j);
    let left = min_path_sum_dfs(grid, i, j - 1);
    // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    std::cmp::min(left, up) + grid[i as usize][j as usize]
}

/* Минимальная сумма пути: поиск с мемоизацией */
fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // Если это верхняя левая ячейка, завершить поиск
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // Если запись уже есть, вернуть сразу
    if mem[i as usize][j as usize] != -1 {
        return mem[i as usize][j as usize];
    }
    // Минимальная стоимость пути для левой и верхней ячеек
    let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
    mem[i as usize][j as usize]
}

/* Минимальная сумма пути: динамическое программирование */
fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // Инициализация таблицы dp
    let mut dp = vec![vec![0; m]; n];
    dp[0][0] = grid[0][0];
    // Переход состояний: первая строка
    for j in 1..m {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Переход состояний: первый столбец
    for i in 1..n {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Переход состояний: остальные строки и столбцы
    for i in 1..n {
        for j in 1..m {
            dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* Минимальная сумма пути: динамическое программирование с оптимизацией памяти */
fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // Инициализация таблицы dp
    let mut dp = vec![0; m];
    // Переход состояний: первая строка
    dp[0] = grid[0][0];
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Переход состояний: остальные строки
    for i in 1..n {
        // Переход состояний: первый столбец
        dp[0] = dp[0] + grid[i][0];
        // Переход состояний: остальные столбцы
        for j in 1..m {
            dp[j] = std::cmp::min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    dp[m - 1]
}

/* Driver Code */
pub fn main() {
    let grid = vec![
        vec![1, 3, 1, 5],
        vec![2, 2, 4, 2],
        vec![5, 3, 2, 1],
        vec![4, 3, 5, 2],
    ];
    let (n, m) = (grid.len(), grid[0].len());

    // Полный перебор
    let res = min_path_sum_dfs(&grid, n as i32 - 1, m as i32 - 1);
    println!("Минимальная сумма пути из левого верхнего угла в правый нижний = {res}");

    // Поиск с мемоизацией
    let mut mem = vec![vec![0; m]; n];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n as i32 - 1, m as i32 - 1);
    println!("Минимальная сумма пути из левого верхнего угла в правый нижний = {res}");

    // Динамическое программирование
    let res = min_path_sum_dp(&grid);
    println!("Минимальная сумма пути из левого верхнего угла в правый нижний = {res}");

    // Динамическое программирование с оптимизацией памяти
    let res = min_path_sum_dp_comp(&grid);
    println!("Минимальная сумма пути из левого верхнего угла в правый нижний = {res}");
}
