/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // Добавление элемента в кучу
    println!("\nПосле добавления элемента {} в кучу", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\nПосле извлечения элемента вершины кучи {}", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Driver Code */
fn main() {
    /* Инициализация кучи */
    // Инициализация минимальной кучи
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // BinaryHeap в Rust является максимальной кучей; для минимальной кучи обычно используют оболочку Reverse
    // Инициализировать максимальную кучу
    let mut max_heap = BinaryHeap::new();

    println!("\nНиже приведен тестовый пример для max-heap");

    /* Добавление элемента в кучу */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* Получение элемента с вершины кучи */
    let peek = max_heap.peek().unwrap();
    println!("\nЭлемент на вершине кучи = {}", peek);

    /* Извлечение элемента с вершины кучи */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* Получение размера кучи */
    let size = max_heap.len();
    println!("\nКоличество элементов в куче = {}", size);

    /* Проверка, пуста ли куча */
    let is_empty = max_heap.is_empty();
    println!("\nПуста ли куча: {}", is_empty);

    /* Построить кучу по входному списку */
    // Временная сложность равна O(n), а не O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\nПосле построения min-heap из входного списка");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}
