/**
 * File: quick_sort.js
 * Created Time: 2022-12-01
 * Author: IsChristina (christinaxia77@foxmail.com)
 */

/* Класс быстрой сортировки */
class QuickSort {
    /* Обмен элементов */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение с опорными указателями */
    partition(nums, left, right) {
        // Взять nums[left] в качестве опорного элемента
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Идти слева направо в поисках первого элемента больше опорного
            }
            // Обмен элементов
            this.swap(nums, i, j); // Поменять эти два элемента местами
        }
        this.swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    quickSort(nums, left, right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) return;
        // Разбиение с опорными указателями
        const pivot = this.partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки (оптимизация медианным опорным элементом) */
class QuickSortMedian {
    /* Обмен элементов */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Выбрать медиану из трех кандидатов */
    medianThree(nums, left, mid, right) {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m находится между l и r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l находится между m и r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    partition(nums, left, right) {
        // Выбрать медиану из трех кандидатов
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Переместить медиану в крайний левый элемент массива
        this.swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
            this.swap(nums, i, j); // Поменять эти два элемента местами
        }
        this.swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    quickSort(nums, left, right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) return;
        // Разбиение с опорными указателями
        const pivot = this.partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки (оптимизация глубины рекурсии) */
class QuickSortTailCall {
    /* Обмен элементов */
    swap(nums, i, j) {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение с опорными указателями */
    partition(nums, left, right) {
        // Взять nums[left] в качестве опорного элемента
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
            this.swap(nums, i, j); // Поменять эти два элемента местами
        }
        this.swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    quickSort(nums, left, right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            let pivot = this.partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
}

/* Driver Code */
/* Быстрая сортировка */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('После быстрой сортировки nums =', nums);

/* Быстрая сортировка (оптимизация медианным опорным элементом) */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('После быстрой сортировки (оптимизация медианным опорным элементом) nums =', nums1);

/* Быстрая сортировка (оптимизация глубины рекурсии) */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('После быстрой сортировки (оптимизация глубины рекурсии) nums =', nums2);
