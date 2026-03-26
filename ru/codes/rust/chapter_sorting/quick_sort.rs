/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* Быстрая сортировка */
struct QuickSort;

impl QuickSort {
    /* Разбиение методом двух указателей */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Искать справа налево первый элемент, меньший опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Искать слева направо первый элемент, больший опорного
            }
            nums.swap(i, j); // Поменять эти два элемента местами
        }
        nums.swap(i, left); // Переместить опорный элемент на границу двух подмассивов
        i // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if left >= right {
            return;
        }
        // Разбиение методом двух указателей
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Рекурсивно обработать левый и правый подмассивы
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Быстрая сортировка (оптимизация с медианным опорным элементом) */
struct QuickSortMedian;

impl QuickSortMedian {
    /* Выбрать медиану из трех кандидатов */
    fn median_three(nums: &mut [i32], left: usize, mid: usize, right: usize) -> usize {
        let (l, m, r) = (nums[left], nums[mid], nums[right]);
        if (l <= m && m <= r) || (r <= m && m <= l) {
            return mid; // m находится между l и r
        }
        if (m <= l && l <= r) || (r <= l && l <= m) {
            return left; // l находится между m и r
        }
        right
    }

    /* Разбиение методом двух указателей (медиана трех) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Выбрать медиану из трех кандидатов
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Переместить медиану в самый левый конец массива
        nums.swap(left, med);
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Искать справа налево первый элемент, меньший опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Искать слева направо первый элемент, больший опорного
            }
            nums.swap(i, j); // Поменять эти два элемента местами
        }
        nums.swap(i, left); // Переместить опорный элемент на границу двух подмассивов
        i // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    pub fn quick_sort(left: i32, right: i32, nums: &mut [i32]) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if left >= right {
            return;
        }
        // Разбиение методом двух указателей
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Рекурсивно обработать левый и правый подмассивы
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Быстрая сортировка (оптимизация глубины рекурсии) */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* Разбиение методом двух указателей */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Искать справа налево первый элемент, меньший опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Искать слева направо первый элемент, больший опорного
            }
            nums.swap(i, j); // Поменять эти два элемента местами
        }
        nums.swap(i, left); // Переместить опорный элемент на границу двух подмассивов
        i // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    pub fn quick_sort(mut left: i32, mut right: i32, nums: &mut [i32]) {
        // Завершить, когда длина подмассива равна 1
        while left < right {
            // Операция разбиения методом двух указателей
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный диапазон равен [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон равен [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* Быстрая сортировка */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("Быстрая сортировкапосле завершения nums = {:?}", nums);

    /* Быстрая сортировка (оптимизация с медианным опорным элементом) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("Быстрая сортировка (оптимизация с медианным опорным элементом)после завершения nums = {:?}", nums);

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("Быстрая сортировка (оптимизация глубины рекурсии)после завершения nums = {:?}", nums);
}
