/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* Найти k наибольших элементов массива с помощью кучи */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap — макс-куча. Обёртка Reverse меняет порядок сравнения элементов и даёт мин-кучу
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // Добавить в кучу первые k элементов массива
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
    for &num in nums.iter().skip(k) {
        // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
        if num > heap.peek().unwrap().0 {
            heap.pop();
            heap.push(Reverse(num));
        }
    }
    heap
}

/* Пример использования */
fn main() {
    let nums = vec![1, 7, 6, 3, 2];
    let k = 3;

    let res = top_k_heap(nums, k);
    println!("Наибольшие элементы (всего {}):", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}
