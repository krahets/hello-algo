/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // Добавить элемент в кучу
    println!("\nЭлемент {} после добавления в кучу", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\nвершина кучиЭлемент {} после извлечения из кучи", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Driver Code */
fn main() {
    /* Инициализировать кучу */
    // Инициализировать min-кучу
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // BinaryHeap в Rust является max-кучей; для min-кучи обычно оборачивают элементы в Reverse
    // Инициализировать max-кучу
    let mut max_heap = BinaryHeap::new();

    println!("\nНиже приведены тестовые примеры max-кучи");

    /* Добавить элемент в кучу */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* Получить верхний элемент кучи */
    let peek = max_heap.peek().unwrap();
    println!("\nЭлемент на вершине кучи равен {}", peek);

    /* Извлечь верхний элемент из кучи */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* Получить размер кучи */
    let size = max_heap.len();
    println!("\nКоличество элементов в куче равно {}", size);

    /* Проверить, пуста ли куча */
    let is_empty = max_heap.is_empty();
    println!("\nКуча пуста: {}", is_empty);

    /* Входной список и построение кучи */
    // Временная сложность равна O(n), а не O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\nПосле построения min-кучи из входного списка");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}
