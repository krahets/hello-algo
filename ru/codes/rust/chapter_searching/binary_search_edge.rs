/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* Двоичный поиск первого вхождения target */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // Задача равносильна поиску позиции вставки target
    let i = binary_search_insertion(nums, target);
    // Значение target не найдено, возвращаем -1
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // Значение target найдено, возвращаем индекс i
    i
}

/* Двоичный поиск последнего вхождения target */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // Сводим задачу к поиску первого вхождения target + 1
    let i = binary_search_insertion(nums, target + 1);
    // j указывает на последнее вхождение target, а i — на первый элемент, больший target
    let j = i - 1;
    // Значение target не найдено, возвращаем -1
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // Значение target найдено, возвращаем индекс j
    j
}

/* Пример использования */
fn main() {
    // Массив с повторяющимися элементами
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nМассив nums = {:?}", nums);

    // Двоичный поиск левой и правой границ
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("Индекс первого вхождения {} = {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("Индекс последнего вхождения {} = {}", target, index);
    }
}
