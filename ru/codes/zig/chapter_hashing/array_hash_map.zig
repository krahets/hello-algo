// File: array_hash_map.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Пара ключ-значение
const Pair = struct {
    key: usize = undefined,
    val: []const u8 = undefined,

   pub fn init(key: usize, val: []const u8) Pair {
        return Pair {
            .key = key,
            .val = val,
        };
    }
};

// Хеш-таблица на основе массива
pub fn ArrayHashMap(comptime T: type) type {
    return struct {
        bucket: ?std.ArrayList(?T) = null,
        mem_allocator: std.mem.Allocator = undefined,

        const Self = @This();
        
        // Конструктор
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            self.mem_allocator = allocator;
            // Инициализировать корзину (массив) длиной 100
            self.bucket = std.ArrayList(?T).init(self.mem_allocator);
            var i: i32 = 0;
            while (i < 100) : (i += 1) {
                try self.bucket.?.append(null);
            }
        }

        // Деструктор
        pub fn deinit(self: *Self) void {
            if (self.bucket != null) self.bucket.?.deinit();
        }

        // Хеш-функция
        fn hashFunc(key: usize) usize {
            var index = key % 100;
            return index;
        }

        // Операция поиска
        pub fn get(self: *Self, key: usize) []const u8 {
            var index = hashFunc(key);
            var pair = self.bucket.?.items[index];
            return pair.?.val;
        }

        // Операция добавления
        pub fn put(self: *Self, key: usize, val: []const u8) !void {
            var pair = Pair.init(key, val);
            var index = hashFunc(key);
            self.bucket.?.items[index] = pair;
        }

        // Операция удаления
        pub fn remove(self: *Self, key: usize) !void {
            var index = hashFunc(key);
            // Присвоить null, что означает удаление
            self.bucket.?.items[index] = null;
        }       

        // Получить все пары ключ-значение
        pub fn pairSet(self: *Self) !std.ArrayList(T) {
            var entry_set = std.ArrayList(T).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try entry_set.append(item.?);
            }
            return entry_set;
        }  

        // Получить все ключи
        pub fn keySet(self: *Self) !std.ArrayList(usize) {
            var key_set = std.ArrayList(usize).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try key_set.append(item.?.key);
            }
            return key_set;
        }  

        // Получить все значения
        pub fn valueSet(self: *Self) !std.ArrayList([]const u8) {
            var value_set = std.ArrayList([]const u8).init(self.mem_allocator);
            for (self.bucket.?.items) |item| {
                if (item == null) continue;
                try value_set.append(item.?.val);
            }
            return value_set;
        }

        // Вывести хеш-таблицу
        pub fn print(self: *Self) !void {
            var entry_set = try self.pairSet();
            defer entry_set.deinit();
            for (entry_set.items) |item| {
                std.debug.print("{} -> {s}\n", .{item.key, item.val});
            }
        }
    };
}

// Driver Code
pub fn main() !void {
    // Инициализация хеш-таблицы
    var map = ArrayHashMap(Pair){};
    try map.init(std.heap.page_allocator);
    defer map.deinit();

    // Операция добавления
    // Добавить пару (key, value) в хеш-таблицу
    try map.put(12836, "Сяо Ха");
    try map.put(15937, "Сяо Ло");
    try map.put(16750, "Сяо Суань");
    try map.put(13276, "Сяо Фа");
    try map.put(10583, "Сяо Я");
    std.debug.print("\nПосле добавления хеш-таблица имеет вид\nКлюч -> Значение\n", .{});
    try map.print();

    // Операция поиска
    // Передать ключ key в хеш-таблицу и получить значение value
    var name = map.get(15937);
    std.debug.print("\nПо номеру 15937 найдено имя {s}\n", .{name});

    // Операция удаления
    // Удалить пару (key, value) из хеш-таблицы
    try map.remove(10583);
    std.debug.print("\nПосле удаления 10583 хеш-таблица имеет вид\nКлюч -> Значение\n", .{});
    try map.print();
    
    // Обход хеш-таблицы
    std.debug.print("\nОтдельный обход пар ключ-значение\n", .{});
    var entry_set = try map.pairSet();
    for (entry_set.items) |kv| {
        std.debug.print("{} -> {s}\n", .{kv.key, kv.val});
    }
    defer entry_set.deinit();
    std.debug.print("\nОтдельный обход ключей\n", .{});
    var key_set = try map.keySet();
    for (key_set.items) |key| {
        std.debug.print("{}\n", .{key});
    }
    defer key_set.deinit();
    std.debug.print("\nОтдельный обход значений\n", .{});
    var value_set = try map.valueSet();
    for (value_set.items) |val| {
        std.debug.print("{s}\n", .{val});
    }
    defer value_set.deinit();

    _ = try std.io.getStdIn().reader().readByte();
}