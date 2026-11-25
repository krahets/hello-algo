/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* Константная сложность */
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
    // Число итераций пропорционально квадрату размера данных n
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* Квадратичная сложность (пузырьковая сортировка) */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // Счётчик

    // Внешний цикл: неотсортированный участок — [0, i]
    for i in (1..nums.len()).rev() {
        // Внутренний цикл обменами перемещает максимум участка [0, i] на его правый край
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Поменять местами nums[j] и nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Обмен элементов состоит из трёх элементарных операций
            }
        }
    }
    count
}

/* Экспоненциальная сложность (цикл) */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // На каждом шаге клетка делится надвое. Получаем 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* Экспоненциальная сложность (рекурсия) */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* Логарифмическая сложность (цикл) */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* Логарифмическая сложность (рекурсия) */
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

/* Факториальная сложность (рекурсия) */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // Разветвить одну задачу на n подзадач
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* Основная программа */
fn main() {
    // Попробуйте менять n и следить за ростом числа операций при разной сложности
    let n: i32 = 8;
    println!("Размер входных данных n = {}", n);

    let mut count = constant(n);
    println!("Число операций при константной сложности = {}", count);

    count = linear(n);
    println!("Число операций при линейной сложности = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("Число операций при линейной сложности (обход массива) = {}", count);

    count = quadratic(n);
    println!("Число операций при квадратичной сложности = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("Число операций при квадратичной сложности (пузырьковая сортировка) = {}", count);

    count = exponential(n);
    println!("Число операций при экспоненциальной сложности (цикл) = {}", count);
    count = exp_recur(n);
    println!("Число операций при экспоненциальной сложности (рекурсия) = {}", count);

    count = logarithmic(n);
    println!("Число операций при логарифмической сложности (цикл) = {}", count);
    count = log_recur(n);
    println!("Число операций при логарифмической сложности (рекурсия) = {}", count);

    count = linear_log_recur(n);
    println!("Число операций при линейно-логарифмической сложности (рекурсия) = {}", count);

    count = factorial_recur(n);
    println!("Число операций при факториальной сложности (рекурсия) = {}", count);
}
