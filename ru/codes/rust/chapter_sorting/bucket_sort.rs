/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Сортировка по бакетам */
fn bucket_sort(nums: &mut [f64]) {
    // Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. Распределить элементы массива по бакетам
    for &num in nums.iter() {
        // Входданныедиапазонравно [0, 1), Использовать num * k отобразить виндексдиапазон [0, k-1]
        let i = (num * k as f64) as usize;
        // Добавить num в бакет i
        buckets[i].push(num);
    }
    // 2. Выполнить сортировку внутри каждого бакета
    for bucket in &mut buckets {
        // Использовать встроенную функцию сортировки; при необходимости ее можно заменить другим алгоритмом сортировки
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. Обойти бакеты и объединить результат
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
    // ПустьВходданныеравночисла с плавающей точкой, диапазонравно [0, 1)
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("Сортировка по бакетампосле завершения nums =");
    print_util::print_array(&nums);
}
