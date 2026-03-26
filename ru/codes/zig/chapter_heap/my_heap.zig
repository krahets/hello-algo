// File: my_heap.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Упрощенная реализация класса кучи
pub fn MaxHeap(comptime T: type) type {
    return struct {
        const Self = @This();
        
        max_heap: ?std.ArrayList(T) = null,      // Использовать список вместо массива, чтобы не учитывать проблему расширения

        // Конструктор, создающий кучу по входному списку
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []const T) !void {
            if (self.max_heap != null) return;
            self.max_heap = std.ArrayList(T).init(allocator);
            // Добавить элементы списка в кучу без изменений
            try self.max_heap.?.appendSlice(nums);
            // Выполнить heapify для всех узлов, кроме листовых
            var i: usize = parent(self.size() - 1) + 1;
            while (i > 0) : (i -= 1) {
                try self.siftDown(i - 1);
            }
        }

        // Деструктор, Освободить память
        pub fn deinit(self: *Self) void {
            if (self.max_heap != null) self.max_heap.?.deinit();
        }

        // Получить индекс левого дочернего узла
        fn left(i: usize) usize {
            return 2 * i + 1;
        }

        // Получить индекс правого дочернего узла
        fn right(i: usize) usize {
            return 2 * i + 2;
        }

        // Получить индекс родительского узла
        fn parent(i: usize) usize {
            // return (i - 1) / 2; // Округление вниз при делении
            return @divFloor(i - 1, 2);
        }

        // Поменять элементы местами
        fn swap(self: *Self, i: usize, j: usize) !void {
            var tmp = self.max_heap.?.items[i];
            try self.max_heap.?.replaceRange(i, 1, &[_]T{self.max_heap.?.items[j]});
            try self.max_heap.?.replaceRange(j, 1, &[_]T{tmp});
        }

        // Получить размер кучи
        pub fn size(self: *Self) usize {
            return self.max_heap.?.items.len;
        }

        // Проверить, пуста ли куча
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Обратиться к элементу на вершине кучи
        pub fn peek(self: *Self) T {
            return self.max_heap.?.items[0];
        }  

        // Добавить элемент в кучу
        pub fn push(self: *Self, val: T) !void {
            // Добавить узел
            try self.max_heap.?.append(val);
            // Выполнить heapify снизу вверх
            try self.siftUp(self.size() - 1);
        }  

        // Начиная с узла i, выполнить просеивание снизу вверх
        fn siftUp(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // Получить родительский узел для узла i
                var p = parent(i);
                // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
                if (p < 0 or self.max_heap.?.items[i] <= self.max_heap.?.items[p]) break;
                // Поменять местами два узла
                try self.swap(i, p);
                // Циклически выполнять просеивание вверх
                i = p;
            }
        }

        // Извлечение элемента из кучи
        pub fn pop(self: *Self) !T {
            // Проверить обработку
            if (self.isEmpty()) unreachable;
            // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
            try self.swap(0, self.size() - 1);
            // Удалить узел
            var val = self.max_heap.?.pop();
            // Выполнить heapify сверху вниз
            try self.siftDown(0);
            // Вернуть элемент на вершине кучи
            return val;
        } 

        // Начиная с узла i, выполнить просеивание сверху вниз
        fn siftDown(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
                var l = left(i);
                var r = right(i);
                var ma = i;
                if (l < self.size() and self.max_heap.?.items[l] > self.max_heap.?.items[ma]) ma = l;
                if (r < self.size() and self.max_heap.?.items[r] > self.max_heap.?.items[ma]) ma = r;
                // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
                if (ma == i) break;
                // Поменять местами два узла
                try self.swap(i, ma);
                // Циклически выполнять просеивание вниз
                i = ma;
            }
        }

        fn lessThan(context: void, a: T, b: T) std.math.Order {
            _ = context;
            return std.math.order(a, b);
        }

        fn greaterThan(context: void, a: T, b: T) std.math.Order {
            return lessThan(context, a, b).invert();
        }

        // Вывести кучу (в виде двоичного дерева)
        pub fn print(self: *Self, mem_allocator: std.mem.Allocator) !void {
            const PQgt = std.PriorityQueue(T, void, greaterThan);
            var queue = PQgt.init(std.heap.page_allocator, {});
            defer queue.deinit();
            try queue.addSlice(self.max_heap.?.items);
            try inc.PrintUtil.printHeap(T, mem_allocator, queue);
        } 
    };
}

// Driver Code
pub fn main() !void {
    // Инициализировать распределитель памяти
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Инициализировать max-кучу
    var max_heap = MaxHeap(i32){};
    try max_heap.init(std.heap.page_allocator, &[_]i32{ 9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2 });
    defer max_heap.deinit();
    std.debug.print("\nВходной список и построение кучипосле\n",.{});
    try max_heap.print(mem_allocator);

    // Получить верхний элемент кучи
    var peek = max_heap.peek();
    std.debug.print("\nЭлемент на вершине кучи равен {}\n",.{peek});

    // Добавить элемент в кучу
    const val = 7;
    try max_heap.push(val);
    std.debug.print("\nЭлемент {} после добавления в кучу\n",.{val});
    try max_heap.print(mem_allocator);

    // Извлечь верхний элемент из кучи
    peek = try max_heap.pop();
    std.debug.print("\nвершина кучиЭлемент {} после извлечения из кучи\n",.{peek});
    try max_heap.print(mem_allocator);

    // Получить размер кучи
    var size = max_heap.size();
    std.debug.print("\nКоличество элементов в куче равно {}",.{size});

    // Проверить, пуста ли куча
    var is_empty = max_heap.isEmpty();
    std.debug.print("\nКуча пуста: {}\n",.{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

