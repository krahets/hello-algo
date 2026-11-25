/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* Чтение случайного элемента */
fn random_access(nums: &[i32]) -> i32 {
    // Выбрать случайное число из интервала [0, nums.len())
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // Получить и вернуть случайный элемент
    let random_num = nums[random_index];
    random_num
}

/* Увеличение длины массива */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // Создать массив увеличенной длины
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // Скопировать все элементы исходного массива в новый
    res[0..nums.len()].copy_from_slice(nums);

    // Вернуть новый массив увеличенной длины
    res
}

/* Вставить num в массив по индексу index */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // Сдвинуть на одну позицию вправо все элементы начиная с index
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // Записать num по индексу index
    nums[index] = num;
}

/* Удалить элемент по индексу index */
fn remove(nums: &mut [i32], index: usize) {
    // Сдвинуть все элементы после index на одну позицию влево
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* Обход массива */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // Обойти массив по индексам
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // Перебрать элементы массива напрямую
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* Поиск заданного элемента в массиве */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* Демонстрационный код */
fn main() {
    /* Инициализация массива */
    let arr: [i32; 5] = [0; 5];
    print!("Массив arr = ");
    print_util::print_array(&arr);
    // В Rust тип с указанной длиной ([i32; 5]) — массив, а без длины (&[i32]) — ссылка на срез
    // Длина массива в Rust определяется при компиляции, поэтому задать её можно только константой
    // В Rust в качестве динамического массива обычно используют вектор
    // Для удобства реализации метода расширения extend() далее рассматриваем вектор как массив
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\nМассив nums = ");
    print_util::print_array(&nums);

    // Чтение случайного элемента
    let random_num = random_access(&nums);
    println!("\nСлучайный элемент nums: {}", random_num);

    // Увеличение длины
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
    println!("\nИндекс элемента 3 в nums = {}", index);
}
