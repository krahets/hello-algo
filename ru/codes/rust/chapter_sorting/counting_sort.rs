/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. Найти максимальный элемент m в массиве
    let m = *nums.iter().max().unwrap();
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. Пройти по counter и записать элементы в исходный массив nums
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
fn counting_sort(nums: &mut [i32]) {
    // 1. Найти максимальный элемент m в массиве
    let m = *nums.iter().max().unwrap() as usize;
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
    // То есть counter[num]-1 — индекс последнего вхождения num в res
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
    // Создать массив res для результата
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // Поместить num по соответствующему индексу
        counter[num as usize] -= 1; // Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
    }
    // Скопировать результат из res в исходный массив nums
    nums.copy_from_slice(&res)
}

/* Тестовый пример */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("После сортировки подсчётом (без поддержки объектов) nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\nПосле сортировки подсчётом nums1 = ");
    print_util::print_array(&nums1);
}
