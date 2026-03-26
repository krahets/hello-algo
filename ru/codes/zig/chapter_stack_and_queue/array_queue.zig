// File: array_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Очередь на основе циклического массива
pub fn ArrayQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        nums: []T = undefined,                          // Массив для хранения элементов очереди
        cap: usize = 0,                                 // вместимость очереди
        front: usize = 0,                               // Указатель front, указывающий на первый элемент очереди
        queSize: usize = 0,                             // Хвостовой указатель указывает на позицию хвоста + 1
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Распределитель памяти

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
        
        // Деструктор(Освободить память)
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Получить вместимость очереди
        pub fn capacity(self: *Self) usize {
            return self.cap;
        }

        // Получить длину очереди
        pub fn size(self: *Self) usize {
            return self.queSize;
        }

        // Проверить, пуста ли очередь
        pub fn isEmpty(self: *Self) bool {
            return self.queSize == 0;
        }

        // Поместить в очередь
        pub fn push(self: *Self, num: T) !void {
            if (self.size() == self.capacity()) {
                std.debug.print("очередьзаполнен\n",.{});
                return;
            }
            // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
            // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
            var rear = (self.front + self.queSize) % self.capacity();
            // Добавить num после хвостового узла
            self.nums[rear] = num;
            self.queSize += 1;
        } 

        // Извлечь из очереди
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
            self.front = (self.front + 1) % self.capacity();
            self.queSize -= 1;
            return num;
        } 

        // Получить элемент в начале очереди
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("очередьпуст");
            return self.nums[self.front];
        } 

        // Вернутьмассив
        pub fn toArray(self: *Self) ![]T {
            // Преобразовать только элементы списка в пределах действительной длины
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
    // Инициализировать очередь
    var capacity: usize = 10;
    var queue = ArrayQueue(i32){};
    try queue.init(std.heap.page_allocator, capacity);
    defer queue.deinit();

    // Поместить элемент в очередь
    try queue.push(1);
    try queue.push(3);
    try queue.push(2);
    try queue.push(5);
    try queue.push(4);
    std.debug.print("очередь queue =",.{});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // Получить элемент в начале очереди
    var peek = queue.peek();
    std.debug.print("\nэлемент в голове очереди peek = {}",.{peek});

    // Извлечь элемент из очереди
    var pop = queue.pop();
    std.debug.print("\nЭлемент, извлеченный из очереди, pop = {}, queue после извлечения =",.{pop});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // Получить длину очереди
    var size = queue.size();
    std.debug.print("\nДлина очереди size = {}",.{size});

    // Проверить, пуста ли очередь
    var is_empty = queue.isEmpty();
    std.debug.print("\nОчередь пуста: {}",.{is_empty});

    // Проверить кольцевой массив
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        try queue.push(i);
        _ = queue.pop();
        std.debug.print("\nИтерация {}: после enqueue + dequeue queue =",.{i});
        inc.PrintUtil.printArray(i32, try queue.toArray());
    }

    _ = try std.io.getStdIn().reader().readByte();
}
