/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import}
use std::{cmp::Reverse, collections::BinaryHeap};
// [endregion]{import}

/* Driver Code */
fn main() {
    // [region]{init}
    /* Инициализация кучи */
    // Инициализация минимальной кучи
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // BinaryHeap в Rust является максимальной кучей; для минимальной кучи обычно используют оболочку Reverse
    // Инициализировать максимальную кучу
    let mut max_heap = BinaryHeap::new();
    // [endregion]{init}

    println!("\nНиже приведен тестовый пример для max-heap");

    // [region]{push}
    /* Добавление элемента в кучу */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);
    // [endregion]{push}
    print_util::print_heap(max_heap.iter().map(|&val| val).collect());

    // [region]{peek}
    /* Получение элемента с вершины кучи */
    let peek = max_heap.peek().unwrap(); // 5
    // [endregion]{peek}
    println!("\nЭлемент на вершине кучи = {}", peek);

    // [region]{pop_1}
    /* Извлечение элемента с вершины кучи */
    // Извлеченные элементы образуют последовательность по убыванию
    let peek = max_heap.pop().unwrap(); // 5
    // [endregion]{pop_1}
    println!("{}", peek);
    // [region]{pop_2}
    let peek = max_heap.pop().unwrap(); // 4
    // [endregion]{pop_2}
    println!("{}", peek);
    // [region]{pop_3}
    let peek = max_heap.pop().unwrap(); // 3
    // [endregion]{pop_3}
    println!("{}", peek);
    // [region]{pop_4}
    let peek = max_heap.pop().unwrap(); // 2
    // [endregion]{pop_4}
    println!("{}", peek);
    // [region]{pop_5}
    let peek = max_heap.pop().unwrap(); // 1
    // [endregion]{pop_5}
    println!("{}", peek);

    // [region]{size}
    /* Получение размера кучи */
    let size = max_heap.len();
    // [endregion]{size}
    println!("\nКоличество элементов в куче = {}", size);

    // [region]{is_empty}
    /* Проверка, пуста ли куча */
    let is_empty = max_heap.is_empty();
    // [endregion]{is_empty}
    println!("\nПуста ли куча: {}", is_empty);

    // [region]{heapify}
    /* Построить кучу по входному списку */
    // Временная сложность равна O(n), а не O(nlogn)
    min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    // [endregion]{heapify}
    println!("\nПосле построения min-heap из входного списка");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}
