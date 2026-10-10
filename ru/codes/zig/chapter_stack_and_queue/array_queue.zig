// File: array_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Очередь на основе кольцевого массива
pub fn ArrayQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        nums: []T = undefined,                          // Массив для хранения элементов очереди
        cap: usize = 0,                                 // Вместимость очереди
        front: usize = 0,                               // Указатель head, указывающий на первый элемент очереди
        queSize: usize = 0,                             // Указатель хвоста, указывающий на позицию после хвоста
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Аллокатор памяти

        // Конструктор (выделение памяти + инициализация массива)
        pub fn init(self: *Self, allocator: std.mem.Allocator, cap: usize) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.cap = cap;
            self.nums = try self.mem_allocator.alloc(T, self.cap);
            @memset(self.nums, @as(T, 0));
        }
        
        // Деструктор (освобождение памяти)
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Получить вместимость очереди
        pub fn capacity(self: *Self) usize {
            return self.cap;
        }

        // Получение длины очереди
        pub fn size(self: *Self) usize {
            return self.queSize;
        }

        // Проверка, пуста ли очередь
        pub fn isEmpty(self: *Self) bool {
            return self.queSize == 0;
        }

        // Поместить в очередь
        pub fn push(self: *Self, num: T) !void {
            if (self.size() == self.capacity()) {
                std.debug.print("Очередь заполнена\n", .{});
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            var rear = (self.front + self.queSize) % self.capacity();
            // Добавить num после хвостового узла
            self.nums[rear] = num;
            self.queSize += 1;
        } 

        // Извлечь из очереди
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            self.front = (self.front + 1) % self.capacity();
            self.queSize -= 1;
            return num;
        } 

        // Доступ к элементу в начале очереди
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("очередь пуста");
            return self.nums[self.front];
        } 

        // Вернуть массив
        pub fn toArray(self: *Self) ![]T {
            // Преобразовывать только элементы списка в пределах фактической длины
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            var j: usize = self.front;
            while (i < self.size()) : ({ i += 1; j += 1; }) {
                res[i] = self.nums[j % self.capacity()];
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // Инициализация очереди
    var capacity: usize = 10;
    var queue = ArrayQueue(i32){};
    try queue.init(std.heap.page_allocator, capacity);
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

    // Проверка кольцевого массива
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        try queue.push(i);
        _ = queue.pop();
        std.debug.print("\nПосле {}-го добавления и извлечения queue = ", .{i});
        inc.PrintUtil.printArray(i32, try queue.toArray());
    }

    _ = try std.io.getStdIn().reader().readByte();
}
