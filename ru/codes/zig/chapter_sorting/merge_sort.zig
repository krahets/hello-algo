// File: merge_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Объединить левый и правый подмассивы
// Диапазон левого подмассива [left, mid]
// Диапазон правого подмассива [mid + 1, right]
fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
    // Инициализация вспомогательного массива
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var tmp = try mem_allocator.alloc(i32, right + 1 - left);
    std.mem.copy(i32, tmp, nums[left..right+1]);
    // Начальный и конечный индексы левого подмассива
    var leftStart = left - left;
    var leftEnd = mid - left;
    // Начальный и конечный индексы правого подмассива
    var rightStart = mid + 1 - left;
    var rightEnd = right - left;
    // i и j указывают соответственно на первые элементы левого и правого подмассивов
    var i = leftStart;
    var j = rightStart;
    // Объединить левый и правый подмассивы, перезаписывая исходный массив nums
    var k = left;
    while (k <= right) : (k += 1) {
        // Если «левый подмассив уже полностью слит», выбрать элемент правого подмассива и выполнить j++
        if (i > leftEnd) {
            nums[k] = tmp[j];
            j += 1;
        // Иначе, если «правый подмассив уже полностью слит» или «элемент левого подмассива <= элементу правого подмассива», выбрать элемент левого подмассива и выполнить i++
        } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
            nums[k] = tmp[i];
            i += 1;
        // Иначе, если «оба подмассива еще не полностью слиты» и «элемент левого подмассива > элемента правого подмассива», выбрать элемент правого подмассива и выполнить j++
        } else {
            nums[k] = tmp[j];
            j += 1;
        }
    }
}

// Сортировка слиянием
fn mergeSort(nums: []i32, left: usize, right: usize) !void {
    // Условие завершения
    if (left >= right) return;              // Завершить рекурсию, когда длина подмассива равна 1
    // Этап разбиения
    var mid = left + (right - left) / 2;    // Вычислить середину
    try mergeSort(nums, left, mid);         // Рекурсивно обработать левый подмассив
    try mergeSort(nums, mid + 1, right);    // Рекурсивно обработать правый подмассив
    // Этап слияния
    try merge(nums, left, mid, right);
}

// Driver Code
pub fn main() !void {
    // Сортировка слиянием
    var nums = [_]i32{ 7, 3, 2, 6, 0, 1, 5, 4 };
    try mergeSort(&nums, 0, nums.len - 1);
    std.debug.print("После завершения сортировки слиянием nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    _ = try std.io.getStdIn().reader().readByte();
}
