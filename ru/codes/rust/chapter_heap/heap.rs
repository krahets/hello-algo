/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // Вставить элемент в кучу
    println!("\nПосле вставки элемента {}:", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\nПосле извлечения элемента {} из корня:", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Пример использования */
fn main() {
    /* Инициализировать кучу */
    // Инициализировать мин-кучу
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // BinaryHeap в Rust — макс-куча. Для мин-кучи элементы обычно оборачивают в Reverse
    // Инициализировать макс-кучу
    let mut max_heap = BinaryHeap::new();

    println!("\nВ этом примере используется макс-куча");

    /* Вставить элемент в кучу */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* Получить элемент в корне */
    let peek = max_heap.peek().unwrap();
    println!("\nЭлемент в корне: {}", peek);

    /* Извлечь элемент из корня */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* Размер кучи */
    let size = max_heap.len();
    println!("\nЧисло элементов в куче: {}", size);

    /* Проверить, пуста ли куча */
    let is_empty = max_heap.is_empty();
    println!("\nПуста ли куча: {}", is_empty);

    /* Построить кучу по входному списку */
    // Временная сложность — O(n), а не O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\nМин-куча, построенная по входному списку:");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}
