/**
 * File: quick_sort.rs
 * Created Time: 2023-02-16
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

/* Быстрая сортировка */
struct QuickSort;

impl QuickSort {
    /* Разбиение с опорными указателями */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
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
        // Разбиение с опорными указателями
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Рекурсивно обработать левый и правый подмассивы
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Быстрая сортировка (оптимизация медианным опорным элементом) */
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

    /* Разбиение с опорными указателями (медиана трех) */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Выбрать медиану из трех кандидатов
        let med = Self::median_three(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        nums.swap(left, med);
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
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
        // Разбиение с опорными указателями
        let pivot = Self::partition(nums, left as usize, right as usize) as i32;
        // Рекурсивно обработать левый и правый подмассивы
        Self::quick_sort(left, pivot - 1, nums);
        Self::quick_sort(pivot + 1, right, nums);
    }
}

/* Быстрая сортировка (оптимизация глубины рекурсии) */
struct QuickSortTailCall;

impl QuickSortTailCall {
    /* Разбиение с опорными указателями */
    fn partition(nums: &mut [i32], left: usize, right: usize) -> usize {
        // Взять nums[left] в качестве опорного элемента
        let (mut i, mut j) = (left, right);
        while i < j {
            while i < j && nums[j] >= nums[left] {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while i < j && nums[i] <= nums[left] {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
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
            // Операция разбиения с опорными указателями
            let pivot = Self::partition(nums, left as usize, right as usize) as i32;
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if pivot - left < right - pivot {
                Self::quick_sort(left, pivot - 1, nums); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                Self::quick_sort(pivot + 1, right, nums); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* Быстрая сортировка */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSort::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("После быстрой сортировки nums = {:?}", nums);

    /* Быстрая сортировка (оптимизация медианным опорным элементом) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortMedian::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("После быстрой сортировки (оптимизация медианным опорным элементом) nums = {:?}", nums);

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    let mut nums = [2, 4, 1, 0, 3, 5];
    QuickSortTailCall::quick_sort(0, (nums.len() - 1) as i32, &mut nums);
    println!("После быстрой сортировки (оптимизация глубины рекурсии) nums = {:?}", nums);
}
