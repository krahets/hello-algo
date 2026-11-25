/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Двоичный поиск: задача f(i, j) */
fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
    // Если интервал пуст, искомого элемента нет. Возвращаем -1
    if i > j {
        return -1;
    }
    let m: i32 = i + (j - i) / 2;
    if nums[m as usize] < target {
        // Рекурсивно решаем подзадачу f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if nums[m as usize] > target {
        // Рекурсивно решаем подзадачу f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Искомый элемент найден. Возвращаем его индекс
        return m;
    }
}

/* Двоичный поиск */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    let n = nums.len() as i32;
    // Решаем задачу f(0, n-1)
    dfs(nums, target, 0, n - 1)
}

/* Основная программа */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Двоичный поиск (замкнутый интервал)
    let index = binary_search(&nums, target);
    println!("Индекс элемента 6 = {index}");
}
