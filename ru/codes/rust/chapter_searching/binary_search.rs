/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* Двоичный поиск на замкнутом интервале */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // Повторяем, пока интервал поиска не опустеет (i > j)
    while i <= j {
        let m = i + (j - i) / 2; // Вычисляем индекс середины m
        if nums[m as usize] < target {
            // Искать target следует в интервале [m+1, j]
            i = m + 1;
        } else if nums[m as usize] > target {
            // Искать target следует в интервале [i, m-1]
            j = m - 1;
        } else {
            // Элемент найден, возвращаем его индекс
            return m;
        }
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
    let mut i = 0;
    let mut j = nums.len() as i32;
    // Повторяем, пока интервал поиска не опустеет (i = j)
    while i < j {
        let m = i + (j - i) / 2; // Вычисляем индекс середины m
        if nums[m as usize] < target {
            // Искать target следует в интервале [m+1, j)
            i = m + 1;
        } else if nums[m as usize] > target {
            // Искать target следует в интервале [i, m)
            j = m;
        } else {
            // Элемент найден, возвращаем его индекс
            return m;
        }
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Пример использования */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Двоичный поиск на замкнутом интервале
    let mut index = binary_search(&nums, target);
    println!("Индекс элемента 6 = {index}");

    // Двоичный поиск на полуинтервале с открытой правой границей
    index = binary_search_lcro(&nums, target);
    println!("Индекс элемента 6 = {index}");
}
