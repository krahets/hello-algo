// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Случайный доступ к элементу
pub fn randomAccess(nums: []const i32) i32 {
    // Случайным образом выбрать целое число из интервала [0, nums.len)
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // Получить и вернуть случайный элемент
    const randomNum = nums[random_index];
    return randomNum;
}

// Увеличить длину массива
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // Инициализировать массив увеличенной длины
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // Скопировать все элементы исходного массива в новый массив
    std.mem.copyForwards(i32, res, nums);

    // Вернуть новый массив после расширения
    return res;
}

// Вставить элемент num по индексу index в массив
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // Присвоить num элементу по индексу index
    nums[index] = num;
}

// Удалить элемент по индексу index
pub fn remove(nums: []i32, index: usize) void {
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// Обход массива
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // Обход массива по индексам
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // Непосредственно обходить элементы массива
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // Одновременно обходить индексы и элементы данных
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// Найти заданный элемент в массиве
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// Driver Code
pub fn run() !void {
    // Инициализация массива
    const arr = [_]i32{0} ** 5;
    std.debug.print("Массив arr = {}\n", .{utils.fmt.slice(&arr)});

    // Срез массива
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // Превратить указатель в срез через известную во время выполнения переменную known_at_runtime_zero
    std.debug.print("Массив nums = {}\n", .{utils.fmt.slice(nums)});

    // Случайный доступ
    const randomNum = randomAccess(nums);
    std.debug.print("Случайный элемент из nums = {}\n", .{randomNum});

    // Инициализация аллокатора памяти
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // Расширение длины
    nums = try extend(allocator, nums, 3);
    std.debug.print("После расширения длины массива до 8 nums = {}\n", .{utils.fmt.slice(nums)});

    // Вставка элемента
    insert(nums, 6, 3);
    std.debug.print("После вставки числа 6 по индексу 3 nums = {}\n", .{utils.fmt.slice(nums)});

    // Удаление элемента
    remove(nums, 2);
    std.debug.print("После удаления элемента по индексу 2 nums = {}\n", .{utils.fmt.slice(nums)});

    // Обход массива
    traverse(nums);

    // Поиск элемента
    const index = find(nums, 3);
    std.debug.print("Поиск элемента 3 в nums: индекс = {}\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
