/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::seq::SliceRandom;
use rand::thread_rng;

/* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
fn random_numbers(n: i32) -> Vec<i32> {
    // Создать массив nums = { 1, 2, 3, ..., n }
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // Случайно перемешать элементы массива
    nums.shuffle(&mut thread_rng());
    nums
}

/* Найти индекс числа 1 в массиве nums */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\nМассив [1, 2, ..., n] после перемешивания = ");
        print_util::print_array(&nums);
        println!("\nИндекс числа 1 = {}", index);
    }
}
