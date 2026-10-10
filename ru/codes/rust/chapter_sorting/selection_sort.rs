/*
 * File: selection_sort.rs
 * Created Time: 2023-05-30
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* Сортировка выбором */
fn selection_sort(nums: &mut [i32]) {
    if nums.is_empty() {
        return;
    }
    let n = nums.len();
    // Внешний цикл: неотсортированный диапазон [i, n-1]
    for i in 0..n - 1 {
        // Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
        let mut k = i;
        for j in i + 1..n {
            if nums[j] < nums[k] {
                k = j; // Записать индекс минимального элемента
            }
        }
        // Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
        nums.swap(i, k);
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    selection_sort(&mut nums);
    print!("\nПосле сортировки выбором nums = ");
    print_util::print_array(&nums);
}
