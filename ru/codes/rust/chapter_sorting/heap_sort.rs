/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
        if ma == i {
            break;
        }
        // Поменять два узла местами
        nums.swap(i, ma);
        // Продолжить просеивание вниз
        i = ma;
    }
}

/* Пирамидальная сортировка */
fn heap_sort(nums: &mut [i32]) {
    // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // Извлечь максимум из кучи n-1 раз
    for i in (1..nums.len()).rev() {
        // Обменять корень с крайним правым листом (первый элемент с последним)
        nums.swap(0, i);
        // Выполнить просеивание вниз от корня
        sift_down(nums, i, 0);
    }
}

/* Тестовый пример */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("После пирамидальной сортировки nums = ");
    print_util::print_array(&nums);
}
