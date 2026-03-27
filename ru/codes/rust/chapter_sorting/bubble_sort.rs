/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Пузырьковая сортировка */
fn bubble_sort(nums: &mut [i32]) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for i in (1..nums.len()).rev() {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                nums.swap(j, j + 1);
            }
        }
    }
}

/* Пузырьковая сортировка (оптимизация флагом) */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for i in (1..nums.len()).rev() {
        let mut flag = false; // Инициализировать флаг
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                nums.swap(j, j + 1);
                flag = true; // Записать обмен элементов
            }
        }
        if !flag {
            break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        };
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("После пузырьковой сортировки nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\nПосле пузырьковой сортировки nums1 = ");
    print_util::print_array(&nums1);
}
