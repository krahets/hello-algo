/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* Случайный доступ к элементу */
fn random_access(nums: &[i32]) -> i32 {
    // Случайным образом выбрать число из интервала [0, nums.len())
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

    // Вернуть новый массив после расширения
    res
}

/* Вставить элемент num по индексу index в массив */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
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

/* Обход массива */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // Обход массива по индексам
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
    /* Инициализация массива */
    let arr: [i32; 5] = [0; 5];
    print!("Массив arr = ");
    print_util::print_array(&arr);
    // В Rust при указании длины ([i32; 5]) получается массив, а без указания длины (&[i32]) — срез
    // Так как массивы в Rust имеют длину, определяемую на этапе компиляции, для задания длины можно использовать только константы
    // Vector обычно используется в Rust как тип динамического массива
    // Для удобства реализации метода расширения extend() ниже vector рассматривается как массив (array)
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\nМассив nums = ");
    print_util::print_array(&nums);

    // Случайный доступ
    let random_num = random_access(&nums);
    println!("\nСлучайный элемент из nums = {}", random_num);

    // Расширение длины
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("После увеличения длины массива до 8 nums = ");
    print_util::print_array(&nums);

    // Вставка элемента
    insert(&mut nums, 6, 3);
    print!("\nПосле вставки числа 6 по индексу 3 nums = ");
    print_util::print_array(&nums);

    // Удаление элемента
    remove(&mut nums, 2);
    print!("\nПосле удаления элемента по индексу 2 nums = ");
    print_util::print_array(&nums);

    // Обход массива
    traverse(&nums);

    // Поиск элемента
    let index = find(&nums, 3).unwrap();
    println!("\nПоиск элемента 3 в nums: индекс = {}", index);
}
