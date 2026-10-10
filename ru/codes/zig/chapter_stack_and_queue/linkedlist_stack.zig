// File: linkedlist_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Стек на основе связного списка
pub fn LinkedListStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack_top: ?*inc.ListNode(T) = null,             // Использовать головной узел как вершину стека
        stk_size: usize = 0,                             // Длина стека
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,    // Аллокатор памяти

        // Конструктор (выделение памяти + инициализация стека)
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.stack_top = null;
            self.stk_size = 0;
        }

        // Деструктор (освобождение памяти)
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Получение длины стека
        pub fn size(self: *Self) usize {
            return self.stk_size;
        }

        // Проверка, пуст ли стек
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Доступ к верхнему элементу стека
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("стек пуст");
            return self.stack_top.?.val;
        }  

        // Поместить в стек
        pub fn push(self: *Self, num: T) !void {
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            node.next = self.stack_top;
            self.stack_top = node;
            self.stk_size += 1;
        } 

        // Извлечь из стека
        pub fn pop(self: *Self) T {
            var num = self.peek();
            self.stack_top = self.stack_top.?.next;
            self.stk_size -= 1;
            return num;
        } 

        // Преобразовать стек в массив
        pub fn toArray(self: *Self) ![]T {
            var node = self.stack_top;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[res.len - i - 1] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // Инициализация стека
    var stack = LinkedListStack(i32){};
    try stack.init(std.heap.page_allocator);
    // Отложенное освобождение памяти
    defer stack.deinit();

    // Помещение элемента в стек
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("Стек stack = ", .{});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // Доступ к верхнему элементу стека
    var peek = stack.peek();
    std.debug.print("\nВерхний элемент стека top = {}", .{peek});

    // Извлечение элемента из стека
    var pop = stack.pop();
    std.debug.print("\nИзвлечен элемент pop = {}, стек после извлечения stack = ", .{pop});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // Получение длины стека
    var size = stack.size();
    std.debug.print("\nДлина стека size = {}", .{size});

    // Проверка, пуст ли стек
    var is_empty = stack.isEmpty();
    std.debug.print("\nПуст ли стек = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

