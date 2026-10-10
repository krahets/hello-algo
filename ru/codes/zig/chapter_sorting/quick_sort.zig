// File: quick_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Класс быстрой сортировки
const QuickSort = struct {

    // Обмен элементов
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // Разбиение с опорными указателями
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // Взять nums[left] в качестве опорного элемента
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j and nums[i] <= nums[left]) i += 1; // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j);   // Поменять эти два элемента местами
        }
        swap(nums, i, left);    // Переместить опорный элемент на границу двух подмассивов
        return i;               // Вернуть индекс опорного элемента
    }

    // Быстрая сортировка
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) return;
        // Разбиение с опорными указателями
        var pivot = partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// Класс быстрой сортировки (оптимизация медианным опорным элементом)
const QuickSortMedian = struct {

    // Обмен элементов
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // Выбрать медиану из трех кандидатов
    pub fn medianThree(nums: []i32, left: usize, mid: usize, right: usize) usize {
        var l = nums[left];
        var m = nums[mid];
        var r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m находится между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l находится между m и r
        return right;
    }

    // Разбиение с опорными указателями (медиана трех)
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // Выбрать медиану из трех кандидатов
        var med = medianThree(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j and nums[i] <= nums[left]) i += 1; // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j);   // Поменять эти два элемента местами
        }
        swap(nums, i, left);    // Переместить опорный элемент на границу двух подмассивов
        return i;               // Вернуть индекс опорного элемента
    }

    // Быстрая сортировка
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right) return;
        // Разбиение с опорными указателями
        var pivot = partition(nums, left, right);
        if (pivot == 0) return;
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// Класс быстрой сортировки (оптимизация глубины рекурсии)
const QuickSortTailCall = struct {

    // Обмен элементов
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // Разбиение с опорными указателями
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // Взять nums[left] в качестве опорного элемента
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j and nums[i] <= nums[left]) i += 1; // Идти слева направо в поисках первого элемента больше опорного
            swap(nums, i, j);   // Поменять эти два элемента местами
        }
        swap(nums, i, left);    // Переместить опорный элемент на границу двух подмассивов
        return i;               // Вернуть индекс опорного элемента
    }

    // Быстрая сортировка (оптимизация глубины рекурсии)
    pub fn quickSort(nums: []i32, left_: usize, right_: usize) void {
        var left = left_;
        var right = right_;
        // Завершить рекурсию, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            var pivot = partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);   // Рекурсивно отсортировать левый подмассив
                left = pivot + 1;                   // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right);  // Рекурсивно отсортировать правый подмассив
                right = pivot - 1;                  // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
};

// Driver Code
pub fn main() !void {
    // Быстрая сортировка
    var nums = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSort.quickSort(&nums, 0, nums.len - 1);
    std.debug.print("После завершения быстрой сортировки nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    // Быстрая сортировка (оптимизация медианным опорным элементом)
    var nums1 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortMedian.quickSort(&nums1, 0, nums1.len - 1);
    std.debug.print("\nПосле завершения быстрой сортировки (оптимизация медианным опорным элементом) nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);

    // Быстрая сортировка (оптимизация глубины рекурсии)
    var nums2 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortTailCall.quickSort(&nums2, 0, nums2.len - 1);
    std.debug.print("\nПосле завершения быстрой сортировки (оптимизация глубины рекурсии) nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums2);
    
    _ = try std.io.getStdIn().reader().readByte();
}