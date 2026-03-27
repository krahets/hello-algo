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

        // Деструктор (освобождение памяти)
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // Получение длины стека
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // Проверка, пуст ли стек
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Доступ к верхнему элементу стека
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("стек пуст");
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
    // Инициализация стека
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // Отложенное освобождение памяти
    defer stack.deinit();

    // Помещение элемента в стек
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("Стек stack = ", .{});
    inc.PrintUtil.printList(i32, stack.toList());

    // Доступ к верхнему элементу стека
    var peek = stack.peek();
    std.debug.print("\nВерхний элемент стека peek = {}", .{peek});

    // Извлечение элемента из стека
    var top = stack.pop();
    std.debug.print("\nИзвлечен элемент pop = {}, стек после извлечения stack = ", .{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // Получение длины стека
    var size = stack.size();
    std.debug.print("\nДлина стека size = {}", .{size});

    // Проверка, пуст ли стек
    var is_empty = stack.isEmpty();
    std.debug.print("\nПуст ли стек = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
