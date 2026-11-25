/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Получить k-ю цифру числа num, где exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
    return ((num / exp) % 10) as usize;
}

/* Сортировка подсчётом по k-й цифре элементов nums */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
    let mut counter = [0; 10];
    let n = nums.len();
    // Подсчитать вхождения каждой цифры от 0 до 9
    for i in 0..n {
        let d = digit(nums[i], exp); // Получить k-ю цифру nums[i] и обозначить её d
        counter[d] += 1; // Подсчитать вхождения цифры d
    }
    // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // Пройти массив с конца и заполнить res по данным счётчиков
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // Найти индекс j в массиве для цифры d
        res[j] = nums[i]; // Записать текущий элемент по индексу j
        counter[d] -= 1; // Уменьшить счётчик d на 1
    }
    // Скопировать результат в исходный массив nums
    nums.copy_from_slice(&res);
}

/* Поразрядная сортировка */
fn radix_sort(nums: &mut [i32]) {
    // Найти максимум массива, чтобы определить наибольшее число разрядов
    let m = *nums.into_iter().max().unwrap();
    // Перебирать разряды от младшего к старшему
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* Тестовый пример */
fn main() {
    // Поразрядная сортировка
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("После поразрядной сортировки nums = ");
    print_util::print_array(&nums);
}
