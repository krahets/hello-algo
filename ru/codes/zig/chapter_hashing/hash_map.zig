// File: hash_map.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // Инициализация хеш-таблицы
    var map = std.AutoHashMap(i32, []const u8).init(std.heap.page_allocator);
    // Отложенное освобождение памяти
    defer map.deinit();

    // Операция добавления
    // Добавить пару (key, value) в хеш-таблицу
    try map.put(12836, "Сяо Ха");
    try map.put(15937, "Сяо Ло");
    try map.put(16750, "Сяо Суань");
    try map.put(13276, "Сяо Фа");
    try map.put(10583, "Сяо Я");
    std.debug.print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // Операция поиска
    // Передать ключ key в хеш-таблицу и получить значение value
    var name = map.get(15937).?;
    std.debug.print("\nПо номеру 15937 найдено имя {s}\n", .{name});

    // Операция удаления
    // Удалить пару (key, value) из хеш-таблицы
    _ = map.remove(10583);
    std.debug.print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    // Обход хеш-таблицы
    std.debug.print("\nОтдельный обход пар ключ-значение\n", .{});
    inc.PrintUtil.printHashMap(i32, []const u8, map);

    std.debug.print("\nОтдельный обход ключей\n", .{});
    var it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{}\n", .{kv.key_ptr.*});
    }

    std.debug.print("\nОтдельный обход значений\n", .{});
    it = map.iterator();
    while (it.next()) |kv| {
        std.debug.print("{s}\n", .{kv.value_ptr.*});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

