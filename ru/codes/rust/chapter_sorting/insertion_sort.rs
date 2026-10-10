/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* Сортировка вставками */
fn insertion_sort(nums: &mut [i32]) {
    // Внешний цикл: отсортированный диапазон [0, i-1]
    for i in 1..nums.len() {
        let (base, mut j) = (nums[i], (i - 1) as i32);
        // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
        while j >= 0 && nums[j as usize] > base {
            nums[(j + 1) as usize] = nums[j as usize]; // Сдвинуть nums[j] на одну позицию вправо
            j -= 1;
        }
        nums[(j + 1) as usize] = base; // Поместить base в правильную позицию
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    print!("После сортировки вставками nums = ");
    print_util::print_array(&nums);
}
