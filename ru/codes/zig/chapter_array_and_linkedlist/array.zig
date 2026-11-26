// File: array.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Чтение случайного элемента
pub fn randomAccess(nums: []const i32) i32 {
    // Выбрать случайное целое число из интервала [0, nums.len)
    const random_index = std.crypto.random.intRangeLessThan(usize, 0, nums.len);
    // Получить и вернуть случайный элемент
    const randomNum = nums[random_index];
    return randomNum;
}

// Увеличение длины массива
pub fn extend(allocator: std.mem.Allocator, nums: []const i32, enlarge: usize) ![]i32 {
    // Создать массив увеличенной длины
    const res = try allocator.alloc(i32, nums.len + enlarge);
    @memset(res, 0);

    // Скопировать все элементы исходного массива в новый
    std.mem.copyForwards(i32, res, nums);

    // Вернуть новый массив увеличенной длины
    return res;
}

// Вставить num в массив по индексу index
pub fn insert(nums: []i32, num: i32, index: usize) void {
    // Сдвинуть на одну позицию вправо все элементы начиная с index
    var i = nums.len - 1;
    while (i > index) : (i -= 1) {
        nums[i] = nums[i - 1];
    }
    // Записать num по индексу index
    nums[index] = num;
}

// Удалить элемент по индексу index
pub fn remove(nums: []i32, index: usize) void {
    // Сдвинуть все элементы после index на одну позицию влево
    var i = index;
    while (i < nums.len - 1) : (i += 1) {
        nums[i] = nums[i + 1];
    }
}

// Обход массива
pub fn traverse(nums: []const i32) void {
    var count: i32 = 0;

    // Обойти массив по индексам
    var i: usize = 0;
    while (i < nums.len) : (i += 1) {
        count += nums[i];
    }

    // Перебрать элементы массива напрямую
    count = 0;
    for (nums) |num| {
        count += num;
    }

    // Одновременно перебирать индексы и элементы
    for (nums, 0..) |num, index| {
        count += nums[index];
        count += num;
    }
}

// Поиск заданного элемента в массиве
pub fn find(nums: []i32, target: i32) i32 {
    for (nums, 0..) |num, i| {
        if (num == target) return @intCast(i);
    }
    return -1;
}

// Демонстрационный код
pub fn run() !void {
    // Инициализация массива
    const arr = [_]i32{0} ** 5;
    std.debug.print("Массив arr = {}\n", .{utils.fmt.slice(&arr)});

    // Срез массива
    var array = [_]i32{ 1, 3, 2, 5, 4 };
    var known_at_runtime_zero: usize = 0;
    _ = &known_at_runtime_zero;
    var nums = array[known_at_runtime_zero..array.len]; // Получить срез из указателя с помощью переменной времени выполнения known_at_runtime_zero
    std.debug.print("Массив nums = {}\n", .{utils.fmt.slice(nums)});

    // Чтение случайного элемента
    const randomNum = randomAccess(nums);
    std.debug.print("Случайный элемент nums: {}\n", .{randomNum});

    // Инициализировать распределитель памяти
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // Увеличение длины
    nums = try extend(allocator, nums, 3);
    std.debug.print("После увеличения длины массива до 8 nums = {}\n", .{utils.fmt.slice(nums)});

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
    std.debug.print("Индекс элемента 3 в nums = {}\n", .{index});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "array" {
    try run();
}
