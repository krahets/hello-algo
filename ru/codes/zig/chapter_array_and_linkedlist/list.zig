// File: list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Driver Code
pub fn run() !void {
    // Инициализировать список
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit(); // Отложенное освобождение памяти

    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("Список nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Получить доступ к элементу
    const num = nums.items[1];
    std.debug.print("обратиться киндекс 1 поэлемент, получаем num = {}\n", .{num});

    // Обновить элемент
    nums.items[1] = 0;
    std.debug.print("После обновления элемента по индексу 1 на 0 получаем nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Очистить список
    nums.clearRetainingCapacity();
    std.debug.print("После очистки списка nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Добавить элемент в конец
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);
    std.debug.print("Добавитьэлементпосле nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Вставить элемент в середину
    try nums.insert(3, 6);
    std.debug.print("После вставки числа 6 по индексу 3 получаем nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Удалить элемент
    _ = nums.orderedRemove(3);
    std.debug.print("Удалитьиндекс 3 поэлемент, получаем nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Обходить список по индексам
    var count: i32 = 0;
    var i: usize = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums.items[i];
    }

    // Непосредственно обходить элементы списка
    count = 0;
    for (nums.items) |x| {
        count += x;
    }

    // Объединить два списка
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items);
    std.debug.print("После присоединения списка nums1 к nums получаем nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Отсортировать список
    std.mem.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    std.debug.print("После сортировки списка nums = {}\n", .{utils.fmt.slice(nums.items)});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "list" {
    try run();
}
