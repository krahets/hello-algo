// File: linkedlist_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Очередь на основе связного списка
pub fn LinkedListQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*inc.ListNode(T) = null,                // Головной узел front
        rear: ?*inc.ListNode(T) = null,                 // Хвостовой узел rear
        que_size: usize = 0,                            // Длина очереди
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Аллокатор памяти

        // Конструктор (выделение памяти + инициализация очереди)
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.que_size = 0;
        }

        // Деструктор (освобождение памяти)
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Получение длины очереди
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // Проверка, пуста ли очередь
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Доступ к элементу в начале очереди
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("очередь пуста");
            return self.front.?.val;
        }  

        // Поместить в очередь
        pub fn push(self: *Self, num: T) !void {
            // Добавить num после хвостового узла
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if (self.front == null) {
                self.front = node;
                self.rear = node;
            // Если очередь не пуста, добавить этот узел после хвостового узла
            } else {
                self.rear.?.next = node;
                self.rear = node;
            }
            self.que_size += 1;
        } 

        // Извлечь из очереди
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // Удалить головной узел
            self.front = self.front.?.next;
            self.que_size -= 1;
            return num;
        } 

        // Преобразовать связный список в массив
        pub fn toArray(self: *Self) ![]T {
            var node = self.front;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[i] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // Инициализация очереди
    var queue = LinkedListQueue(i32){};
    try queue.init(std.heap.page_allocator);
    defer queue.deinit();

    // Добавление элемента в очередь
    try queue.push(1);
    try queue.push(3);
    try queue.push(2);
    try queue.push(5);
    try queue.push(4);
    std.debug.print("Очередь queue = ", .{});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // Доступ к элементу в начале очереди
    var peek = queue.peek();
    std.debug.print("\nЭлемент в начале очереди peek = {}", .{peek});

    // Извлечение элемента из очереди
    var pop = queue.pop();
    std.debug.print("\nИзвлечен элемент pop = {}, очередь после извлечения queue = ", .{pop});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // Получение длины очереди
    var size = queue.size();
    std.debug.print("\nДлина очереди size = {}", .{size});

    // Проверка, пуста ли очередь
    var is_empty = queue.isEmpty();
    std.debug.print("\nПуста ли очередь = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
