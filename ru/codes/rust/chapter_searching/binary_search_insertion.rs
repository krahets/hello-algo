/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* Бинарный поиск точки вставки (без повторяющихся элементов) */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Вычислить индекс середины m
        if nums[m as usize] < target {
            i = m + 1; // target находится в интервале [m+1, j]
        } else if nums[m as usize] > target {
            j = m - 1; // target находится в интервале [i, m-1]
        } else {
            return m;
        }
    }
    // target не найден, вернуть точку вставки i
    i
}

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // Вычислить индекс середины m
        if nums[m as usize] < target {
            i = m + 1; // target находится в интервале [m+1, j]
        } else if nums[m as usize] > target {
            j = m - 1; // target находится в интервале [i, m-1]
        } else {
            j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
        }
    }
    // Вернуть точку вставки i
    i
}

/* Driver Code */
fn main() {
    // Массив без повторяющихся элементов
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\nМассив nums = {:?}", nums);
    // Бинарный поиск точки вставки
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("Индекс позиции вставки элемента {} равен {}", target, index);
    }

    // Массив с повторяющимися элементами
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\nМассив nums = {:?}", nums);
    // Бинарный поиск точки вставки
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("Индекс позиции вставки элемента {} равен {}", target, index);
    }
}
