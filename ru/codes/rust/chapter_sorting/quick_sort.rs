/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* Быстрая сортировка */
struct QuickSort;

impl QuickSort {
    /* Разбиение двумя указателями */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Выбрать nums[left] опорным элементом
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Справа налево найти первый элемент меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Слева направо найти первый элемент больше опорного
            }
            nums.swap(i, j); // Поменять эти элементы местами
        }
        nums.swap(i, left); // Обменом поместить опорный элемент на границу подмассивов
        i // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Завершить рекурсию при длине подмассива 1
        if left >= right {
            return;
        }
        // Разбиение двумя указателями
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Рекурсивно отсортировать левый и правый подмассивы
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Быстрая сортировка с выбором медианы в качестве опорного элемента */
struct QuickSortMedian;

impl QuickSortMedian {
    /* Выбрать медиану трёх кандидатов */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m лежит между l и r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l лежит между m и r
        }
        right
    }

    /* Разбиение двумя указателями с выбором медианы трёх */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Выбрать медиану трёх кандидатов
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Обменом поместить медиану в начало массива
        nums.swap(left, med);
        // Выбрать nums[left] опорным элементом
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Справа налево найти первый элемент меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Слева направо найти первый элемент больше опорного
            }
            nums.swap(i, j); // Поменять эти элементы местами
        }
        nums.swap(i, left); // Обменом поместить опорный элемент на границу подмассивов
        i // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Завершить рекурсию при длине подмассива 1
        if left >= right {
            return;
        }
        // Разбиение двумя указателями
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Рекурсивно отсортировать левый и правый подмассивы
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Быстрая сортировка с уменьшенной глубиной рекурсии */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* Разбиение двумя указателями */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Выбрать nums[left] опорным элементом
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Справа налево найти первый элемент меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Слева направо найти первый элемент больше опорного
            }
            nums.swap(i, j); // Поменять эти элементы местами
        }
        nums.swap(i, left); // Обменом поместить опорный элемент на границу подмассивов
        i // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // Завершить обработку при длине подмассива 1
        while left < right {
            // Выполнить разбиение двумя указателями
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Применить быструю сортировку к более короткому подмассиву
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный участок: [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный участок: [left, pivot - 1]
            }
        }
    }
}

/* Тестовый пример */
fn main() {
    /* Быстрая сортировка */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("После быстрой сортировки nums = {:?}", nums);

    /* Быстрая сортировка с выбором медианы в качестве опорного элемента */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("После быстрой сортировки с выбором медианы nums = {:?}", nums);

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("После быстрой сортировки с уменьшенной глубиной рекурсии nums = {:?}", nums);
}
