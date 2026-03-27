/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Бинарный поиск: задача f(i, j) */
fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
    // Если интервал пуст, целевой элемент отсутствует, вернуть -1
    if i > j {
        return -1;
    }
    let m: i32 = i + (j - i) / 2;
    if nums[m as usize] < target {
        // Рекурсивная подзадача f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if nums[m as usize] > target {
        // Рекурсивная подзадача f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Целевой элемент найден, вернуть его индекс
        return m;
    }
}

/* Бинарный поиск */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    let n = nums.len() as i32;
    // Решить задачу f(0, n-1)
    dfs(nums, target, 0, n - 1)
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Бинарный поиск (двусторонне замкнутый интервал)
    let index = binary_search(&nums, target);
    println!("Индекс целевого элемента 6 = {index}");
}
