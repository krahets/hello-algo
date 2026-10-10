/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Сортировка корзинами */
fn bucket_sort(nums: &mut [f64]) {
    // Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. Распределить элементы массива по корзинам
    for &num in nums.iter() {
        // Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
        let i = (num * k as f64) as usize;
        // Добавить num в корзину i
        buckets[i].push(num);
    }
    // 2. Выполнить сортировку внутри каждой корзины
    for bucket in &mut buckets {
        // Использовать встроенную функцию сортировки; ее также можно заменить другим алгоритмом сортировки
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. Обойти корзины и объединить результаты
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Driver Code */
fn main() {
    // Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("После сортировки корзинами nums = ");
    print_util::print_array(&nums);
}
