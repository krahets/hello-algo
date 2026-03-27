/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Получить k-й разряд элемента num, где exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
    return ((num / exp) % 10) as usize;
}

/* Сортировка подсчетом (сортировка по k-му разряду nums) */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // Разряды десятичной системы лежат в диапазоне 0~9, поэтому нужен массив корзин длины 10
    let mut counter = [0; 10];
    let n = nums.len();
    // Подсчитать число появлений каждой цифры от 0 до 9
    for i in 0..n {
        let d = digit(nums[i], exp); // Получить k-й разряд nums[i], обозначив его как d
        counter[d] += 1; // Подсчитать число появлений цифры d
    }
    // Вычислить префиксные суммы и преобразовать «число появлений» в «индекс массива»
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // Выполняя обратный проход, заполнить res элементами по статистике в корзинах
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // Получить индекс j цифры d в массиве
        res[j] = nums[i]; // Поместить текущий элемент по индексу j
        counter[d] -= 1; // Уменьшить количество d на 1
    }
    // Перезаписать исходный массив nums результатом
    nums.copy_from_slice(&res);
}

/* Поразрядная сортировка */
fn radix_sort(nums: &mut [i32]) {
    // Получить максимальный элемент массива, чтобы определить максимальное число разрядов
    let m = *nums.into_iter().max().unwrap();
    // Проходить разряды от младшего к старшему
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* Driver Code */
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
