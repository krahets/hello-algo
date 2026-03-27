/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Сортировка подсчетом */
// Простая реализация, не подходит для сортировки объектов
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. Найти максимальный элемент массива m
    let m = *nums.iter().max().unwrap();
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. Обойти counter и заполнить исходный массив nums элементами
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Сортировка подсчетом */
// Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
fn counting_sort(nums: &mut [i32]) {
    // 1. Найти максимальный элемент массива m
    let m = *nums.iter().max().unwrap() as usize;
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
    // То есть counter[num]-1 — это индекс последнего появления num в res
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    // Инициализировать массив res для хранения результата
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // Поместить num по соответствующему индексу
        counter[num as usize] -= 1; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    }
    // Перезаписать исходный массив nums массивом результата res
    nums.copy_from_slice(&res)
}

/* Driver Code */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("После сортировки подсчетом (объекты не поддерживаются) nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\nПосле сортировки подсчетом nums1 = ");
    print_util::print_array(&nums1);
}
