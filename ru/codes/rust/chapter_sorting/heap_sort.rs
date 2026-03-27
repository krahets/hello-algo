/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Если длина кучи равна n, начиная с узла i выполнить просеивание сверху вниз */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
        if ma == i {
            break;
        }
        // Поменять местами два узла
        nums.swap(i, ma);
        // Циклически выполнять просеивание вниз
        i = ma;
    }
}

/* Сортировка кучей */
fn heap_sort(nums: &mut [i32]) {
    // Построение кучи: выполнить просеивание для всех узлов, кроме листьев
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // Извлекать максимальный элемент из кучи в течение n-1 итераций
    for i in (1..nums.len()).rev() {
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        nums.swap(0, i);
        // Начиная с корневого узла, выполнить просеивание сверху вниз
        sift_down(nums, i, 0);
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("После завершения сортировки кучей nums = ");
    print_util::print_array(&nums);
}
