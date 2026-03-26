/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* Бинарный поиск (двусторонний закрытый интервал) */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // Инициализировать закрытый интервал [0, n-1], где i и j указывают на первый и последний элементы массива
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i > j он пуст)
    while i <= j {
        let m = i + (j - i) / 2; // Вычислить средний индекс m
        if nums[m as usize] < target {
            // Это означает, что target находится в интервале [m+1, j]
            i = m + 1;
        } else if nums[m as usize] > target {
            // Это означает, что target находится в интервале [i, m-1]
            j = m - 1;
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

/* Бинарный поиск (левый закрытый, правый открытый интервал) */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // Инициализировать интервал [0, n), где i и j указывают на первый элемент массива и позицию за последним элементом
    let mut i = 0;
    let mut j = nums.len() as i32;
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i = j он пуст)
    while i < j {
        let m = i + (j - i) / 2; // Вычислить средний индекс m
        if nums[m as usize] < target {
            // Это означает, что target находится в интервале [m+1, j)
            i = m + 1;
        } else if nums[m as usize] > target {
            // Это означает, что target находится в интервале [i, m)
            j = m;
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // Бинарный поиск (двусторонний закрытый интервал)
    let mut index = binary_search(&nums, target);
    println!("Индекс целевого элемента 6 = {index}");

    // Бинарный поиск (левый закрытый, правый открытый интервал)
    index = binary_search_lcro(&nums, target);
    println!("Индекс целевого элемента 6 = {index}");
}
