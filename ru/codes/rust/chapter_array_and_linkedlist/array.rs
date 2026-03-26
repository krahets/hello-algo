/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* Случайный доступ к элементу */
fn random_access(nums: &[i32]) -> i32 {
    // Случайно выбрать число в интервале [0, nums.len())
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // Получить и вернуть случайный элемент
    let random_num = nums[random_index];
    random_num
}

/* Увеличить длину массива */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // Инициализировать массив увеличенной длины
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // Скопировать все элементы исходного массива в новый
    res[0..nums.len()].copy_from_slice(nums);

    // Вернуть новый расширенный массив
    res
}

/* Вставить элемент num в массив по индексу index */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // Сдвинуть индекс index и все последующие элементы на одну позицию назад
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // Присвоить num элементу по индексу index
    nums[index] = num;
}

/* Удалить элемент по индексу index */
fn remove(nums: &mut [i32], index: usize) {
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* Перебрать массив */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // Обходить массив по индексам
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Непосредственно обходить элементы массива
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* Найти заданный элемент в массиве */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    /* Инициализировать массив */
    let arr: [i32; 5] = [0; 5];
    print!("массив arr =");
    print_util::print_array(&arr);
    // В Rust при указании длины ([i32; 5]) это массив, а без указания длины (&[i32]) это срез
    // Поскольку массивы в Rust спроектированы с длиной, определяемой на этапе компиляции, длину можно задавать только константой
    // Vector в Rust обычно используется как тип динамического массива
    // Чтобы упростить реализацию метода расширения extend(), ниже vector рассматривается как array
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\nмассив nums =");
    print_util::print_array(&nums);

    // Случайный доступ
    let random_num = random_access(&nums);
    println!("\nПолученный случайный элемент из nums {}", random_num);

    // Расширение длины
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("После расширения длины массива до 8 получаем nums =");
    print_util::print_array(&nums);

    // Вставить элемент
    insert(&mut nums, 6, 3);
    print!("\nПосле вставки числа 6 по индексу 3 получаем nums =");
    print_util::print_array(&nums);

    // Удалить элемент
    remove(&mut nums, 2);
    print!("\nПосле удаления элемента по индексу 2 получаем nums =");
    print_util::print_array(&nums);

    // Перебрать массив
    traverse(&nums);

    // Найти элемент
    let index = find(&nums, 3).unwrap();
    println!("\nПоиск элемента 3 в nums дает индекс = {}", index);
}
