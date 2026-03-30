// File: radix_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Получить k-й разряд элемента num, где exp = 10^(k-1)
fn digit(num: i32, exp: i32) i32 {
    // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
    return @mod(@divFloor(num, exp), 10);
}

// Сортировка подсчетом (сортировка по k-му разряду nums)
fn countingSortDigit(nums: []i32, exp: i32) !void {
    // Разряды десятичной системы лежат в диапазоне 0~9, поэтому нужен массив корзин длины 10
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    // defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var counter = try mem_allocator.alloc(usize, 10);
    @memset(counter, 0);
    var n = nums.len;
    // Подсчитать число появлений каждой цифры от 0 до 9
    for (nums) |num| {
        var d: u32 = @bitCast(digit(num, exp)); // Получить k-й разряд nums[i], обозначив его как d
        counter[d] += 1; // Подсчитать число появлений цифры d
    }
    // Вычислить префиксные суммы и преобразовать «число появлений» в «индекс массива»
    var i: usize = 1;
    while (i < 10) : (i += 1) {
        counter[i] += counter[i - 1];
    }
    // Выполняя обратный проход, заполнить res элементами по статистике в корзинах
    var res = try mem_allocator.alloc(i32, n);
    i = n - 1;
    while (i >= 0) : (i -= 1) {
        var d: u32 = @bitCast(digit(nums[i], exp));
        var j = counter[d] - 1; // Получить индекс j цифры d в массиве
        res[j] = nums[i];       // Поместить текущий элемент по индексу j
        counter[d] -= 1;        // Уменьшить количество d на 1
        if (i == 0) break;
    }
    // Перезаписать исходный массив nums результатом
    i = 0;
    while (i < n) : (i += 1) {
        nums[i] = res[i];
    }
}

// Поразрядная сортировка
fn radixSort(nums: []i32) !void {
    // Получить максимальный элемент массива, чтобы определить максимальное число разрядов
    var m: i32 = std.math.minInt(i32);
    for (nums) |num| {
        if (num > m) m = num;
    }
    // Проходить разряды от младшего к старшему
    var exp: i32 = 1;
    while (exp <= m) : (exp *= 10) {
        // Выполнить сортировку подсчетом по k-му разряду элементов массива
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // то есть exp = 10^(k-1)
        try countingSortDigit(nums, exp);    
    }
} 

// Driver Code
pub fn main() !void {
    // Поразрядная сортировка
    var nums = [_]i32{ 23, 12, 3, 4, 788, 192 };
    try radixSort(&nums);
    std.debug.print("После завершения поразрядной сортировки nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}