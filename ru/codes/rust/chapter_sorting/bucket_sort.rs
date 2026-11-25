/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Блочная сортировка */
fn bucket_sort(nums: &mut [f64]) {
    // Создать k = n/2 блоков в расчёте на два элемента в каждом
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. Распределить элементы массива по блокам
    for &num in nums.iter() {
        // Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
        let i = (num * k as f64) as usize;
        // Добавить num в блок i
        buckets[i].push(num);
    }
    // 2. Отсортировать каждый блок
    for bucket in &mut buckets {
        // Используем встроенную сортировку. Её можно заменить другим алгоритмом
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. Обойти блоки и объединить результаты
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Тестовый пример */
fn main() {
    // Входные данные — числа с плавающей точкой из интервала [0, 1)
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("После блочной сортировки nums = ");
    print_util::print_array(&nums);
}
