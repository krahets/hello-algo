/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* Слить левый и правый подмассивы */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // Левый подмассив занимает [left, mid], правый — [mid+1, right]
    // Создать временный массив tmp для результата слияния
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // Установить индексы на начало левого и правого подмассивов
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // Пока в обоих подмассивах есть элементы, сравнивать их и копировать меньший во временный массив
    while i <= mid && j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i];
            i += 1;
        } else {
            tmp[k] = nums[j];
            j += 1;
        }
        k += 1;
    }
    // Скопировать оставшиеся элементы подмассивов во временный массив
    while i <= mid {
        tmp[k] = nums[i];
        k += 1;
        i += 1;
    }
    while j <= right {
        tmp[k] = nums[j];
        k += 1;
        j += 1;
    }
    // Скопировать элементы tmp обратно на соответствующий участок nums
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* Сортировка слиянием */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // Условие остановки
    if left >= right {
        return; // Завершить рекурсию, когда длина подмассива равна 1
    }

    // Разбиение
    let mid = left + (right - left) / 2; // Вычислить середину
    merge_sort(nums, left, mid); // Рекурсивно отсортировать левый подмассив
    merge_sort(nums, mid + 1, right); // Рекурсивно отсортировать правый подмассив

    // Слияние
    merge(nums, left, mid, right);
}

/* Тестовый пример */
fn main() {
    /* Сортировка слиянием */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("После сортировки слиянием nums = {:?}", nums);
}
