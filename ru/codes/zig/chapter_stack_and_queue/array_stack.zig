// File: array_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Стек на основе массива
pub fn ArrayStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack: ?std.ArrayList(T) = null,     

        // Конструктор (выделение памяти + инициализация стека)
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.stack == null) {
                self.stack = std.ArrayList(T).init(allocator);
            }
        }

        // Деструктор(Освободить память)
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // Получить длину стека
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // Проверить, пуст ли стек
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Получить верхний элемент стека
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("стекпуст");
            return self.stack.?.items[self.size() - 1];
        }  

        // Поместить в стек
        pub fn push(self: *Self, num: T) !void {
            try self.stack.?.append(num);
        } 

        // Извлечь из стека
        pub fn pop(self: *Self) T {
            var num = self.stack.?.pop();
            return num;
        } 

        // Вернуть ArrayList
        pub fn toList(self: *Self) std.ArrayList(T) {
            return self.stack.?;
        }
    };
}

// Driver Code
pub fn main() !void {
    // Инициализировать стек
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // Отложенное освобождение памяти
    defer stack.deinit();

    // Поместить элемент в стек
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("стек stack =",.{});
    inc.PrintUtil.printList(i32, stack.toList());

    // Получить верхний элемент стека
    var peek = stack.peek();
    std.debug.print("\nвершина стекаэлемент peek = {}",.{peek});

    // Извлечь элемент из стека
    var top = stack.pop();
    std.debug.print("\nизвлечение из стекаэлемент pop = {}, извлечение из стекапосле stack =",.{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // Получить длину стека
    var size = stack.size();
    std.debug.print("\nДлина стека size = {}",.{size});

    // Проверить, пуст ли стек
    var is_empty = stack.isEmpty();
    std.debug.print("\nСтек пуст: {}",.{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
