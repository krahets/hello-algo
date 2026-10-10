/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* Постоянная сложность */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* Линейная сложность */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* Линейная сложность (обход массива) */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // Число итераций пропорционально длине массива
    for _ in nums {
        count += 1;
    }
    count
}

/* Квадратичная сложность */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // Число итераций квадратично зависит от размера данных n
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* Квадратичная сложность (пузырьковая сортировка) */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // Счетчик

    // Внешний цикл: неотсортированный диапазон [0, i]
    for i in (1..nums.len()).rev() {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Обмен элементов включает 3 элементарные операции
            }
        }
    }
    count
}

/* Экспоненциальная сложность (итеративная реализация) */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* Экспоненциальная сложность (рекурсивная реализация) */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* Логарифмическая сложность (итеративная реализация) */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* Логарифмическая сложность (рекурсивная реализация) */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* Линейно-логарифмическая сложность */
fn linear_log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 1;
    }
    let mut count = linear_log_recur(n / 2) + linear_log_recur(n / 2);
    for _ in 0..n {
        count += 1;
    }
    return count;
}

/* Факториальная сложность (рекурсивная реализация) */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // Из одного получается n
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* Driver Code */
fn main() {
    // Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
    let n: i32 = 8;
    println!("Размер входных данных n = {}", n);

    let mut count = constant(n);
    println!("Число операций константной сложности = {}", count);

    count = linear(n);
    println!("Число операций линейной сложности = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("Число операций линейной сложности (обход массива) = {}", count);

    count = quadratic(n);
    println!("Число операций квадратичной сложности = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("Число операций квадратичной сложности (пузырьковая сортировка) = {}", count);

    count = exponential(n);
    println!("Число операций экспоненциальной сложности (итеративная реализация) = {}", count);
    count = exp_recur(n);
    println!("Число операций экспоненциальной сложности (рекурсивная реализация) = {}", count);

    count = logarithmic(n);
    println!("Число операций логарифмической сложности (итеративная реализация) = {}", count);
    count = log_recur(n);
    println!("Число операций логарифмической сложности (рекурсивная реализация) = {}", count);

    count = linear_log_recur(n);
    println!("Число операций линейно-логарифмической сложности (рекурсивная реализация) = {}", count);

    count = factorial_recur(n);
    println!("Число операций факториальной сложности (рекурсивная реализация) = {}", count);
}
