/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* Бинарный поиск самого левого target */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // Эквивалентно поиску точки вставки для target
    let i = binary_search_insertion(nums, target);
    // Если target не найден, вернуть -1
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // Найти target и вернуть индекс i
    i
}

/* Бинарный поиск самого правого target */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // Преобразовать задачу в поиск самого левого элемента target + 1
    let i = binary_search_insertion(nums, target + 1);
    // j указывает на самый правый target, а i указывает на первый элемент, больший target
    let j = i - 1;
    // Если target не найден, вернуть -1
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // Найти target и вернуть индекс j
    j
}

/* Driver Code */
fn main() {
    // Массив с повторяющимися элементами
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nМассив nums = {:?}", nums);

    // Бинарный поиск левой и правой границ
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("Индекс самого левого элемента {} равен {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("Индекс самого правого элемента {} равен {}", target, index);
    }
}
