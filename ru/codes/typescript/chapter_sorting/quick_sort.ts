/**
 * File: quick_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* Класс быстрой сортировки */
class QuickSort {
    /* Обмен элементов */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение двумя указателями */
    partition(nums: number[], left: number, right: number): number {
        // Выбрать nums[left] опорным элементом
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j -= 1; // Справа налево найти первый элемент меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i += 1; // Слева направо найти первый элемент больше опорного
            }
            // Обмен элементов
            this.swap(nums, i, j); // Поменять эти элементы местами
        }
        this.swap(nums, i, left); // Обменом поместить опорный элемент на границу подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    quickSort(nums: number[], left: number, right: number): void {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right) {
            return;
        }
        // Разбиение двумя указателями
        const pivot = this.partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки с выбором медианы */
class QuickSortMedian {
    /* Обмен элементов */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Выбрать медиану трёх кандидатов */
    medianThree(
        nums: number[],
        left: number,
        mid: number,
        right: number
    ): number {
        let l = nums[left],
            m = nums[mid],
            r = nums[right];
        // m лежит между l и r
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        // l лежит между m и r
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /* Разбиение двумя указателями с выбором медианы трёх */
    partition(nums: number[], left: number, right: number): number {
        // Выбрать медиану трёх кандидатов
        let med = this.medianThree(
            nums,
            left,
            Math.floor((left + right) / 2),
            right
        );
        // Обменом поместить медиану в начало массива
        this.swap(nums, left, med);
        // Выбрать nums[left] опорным элементом
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Справа налево найти первый элемент меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Слева направо найти первый элемент больше опорного
            }
            this.swap(nums, i, j); // Поменять эти элементы местами
        }
        this.swap(nums, i, left); // Обменом поместить опорный элемент на границу подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    quickSort(nums: number[], left: number, right: number): void {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right) {
            return;
        }
        // Разбиение двумя указателями
        const pivot = this.partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        this.quickSort(nums, left, pivot - 1);
        this.quickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки с уменьшенной глубиной рекурсии */
class QuickSortTailCall {
    /* Обмен элементов */
    swap(nums: number[], i: number, j: number): void {
        let tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение двумя указателями */
    partition(nums: number[], left: number, right: number): number {
        // Выбрать nums[left] опорным элементом
        let i = left,
            j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left]) {
                j--; // Справа налево найти первый элемент меньше опорного
            }
            while (i < j && nums[i] <= nums[left]) {
                i++; // Слева направо найти первый элемент больше опорного
            }
            this.swap(nums, i, j); // Поменять эти элементы местами
        }
        this.swap(nums, i, left); // Обменом поместить опорный элемент на границу подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    quickSort(nums: number[], left: number, right: number): void {
        // Завершить обработку при длине подмассива 1
        while (left < right) {
            // Выполнить разбиение двумя указателями
            let pivot = this.partition(nums, left, right);
            // Применить быструю сортировку к более короткому подмассиву
            if (pivot - left < right - pivot) {
                this.quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный участок: [pivot + 1, right]
            } else {
                this.quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный участок: [left, pivot - 1]
            }
        }
    }
}

/* Тестовый пример */
/* Быстрая сортировка  */
const nums = [2, 4, 1, 0, 3, 5];
const quickSort = new QuickSort();
quickSort.quickSort(nums, 0, nums.length - 1);
console.log('После быстрой сортировки nums =', nums);

/* Быстрая сортировка с выбором медианы в качестве опорного элемента */
const nums1 = [2, 4, 1, 0, 3, 5];
const quickSortMedian = new QuickSortMedian();
quickSortMedian.quickSort(nums1, 0, nums1.length - 1);
console.log('После быстрой сортировки с выбором медианы nums =', nums1);

/* Быстрая сортировка с уменьшенной глубиной рекурсии */
const nums2 = [2, 4, 1, 0, 3, 5];
const quickSortTailCall = new QuickSortTailCall();
quickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
console.log('После быстрой сортировки с уменьшенной глубиной рекурсии nums =', nums2);

export {};
