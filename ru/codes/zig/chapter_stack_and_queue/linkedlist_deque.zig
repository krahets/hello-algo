// File: linkedlist_deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Узел двусвязного списка
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,     // Значение узла
        next: ?*Self = null,    // Указатель на узел-преемник
        prev: ?*Self = null,    // Указатель на узел-предшественник

        // Initialize a list node with specific value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
            self.prev = null;
        }
    };
}

// Двусторонняя очередь на основе двусвязного списка
pub fn LinkedListDeque(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*ListNode(T) = null,                    // Головной узел front
        rear: ?*ListNode(T) = null,                     // Хвостовой узел rear
        que_size: usize = 0,                             // Длина двусторонней очереди
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

        // Получение длины двусторонней очереди
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // Проверка, пуста ли двусторонняя очередь
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Операция добавления в очередь
        pub fn push(self: *Self, num: T, is_front: bool) !void {
            var node = try self.mem_allocator.create(ListNode(T));
            node.init(num);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (self.isEmpty()) {
                self.front = node;
                self.rear = node;
            // Операция добавления в голову очереди
            } else if (is_front) {
                // Добавить node в голову списка
                self.front.?.prev = node;
                node.next = self.front;
                self.front = node;  // Обновить головной узел
            // Операция добавления в хвост очереди
            } else {
                // Добавить node в хвост списка
                self.rear.?.next = node;
                node.prev = self.rear;
                self.rear = node;   // Обновить хвостовой узел
            }
            self.que_size += 1;      // Обновить длину очереди
        } 

        // Добавление в голову очереди
        pub fn pushFirst(self: *Self, num: T) !void {
            try self.push(num, true);
        } 

        // Добавление в хвост очереди
        pub fn pushLast(self: *Self, num: T) !void {
            try self.push(num, false);
        } 
        
        // Операция извлечения из очереди
        pub fn pop(self: *Self, is_front: bool) T {
            if (self.isEmpty()) @panic("двусторонняя очередь пуста");
            var val: T = undefined;
            // Операция извлечения из головы очереди
            if (is_front) {
                val = self.front.?.val;     // Временно сохранить значение головного узла
                // Удалить головной узел
                var fNext = self.front.?.next;
                if (fNext != null) {
                    fNext.?.prev = null;
                    self.front.?.next = null;
                }
                self.front = fNext;         // Обновить головной узел
            // Операция извлечения из хвоста очереди
            } else {
                val = self.rear.?.val;      // Временно сохранить значение хвостового узла
                // Удалить хвостовой узел
                var rPrev = self.rear.?.prev;
                if (rPrev != null) {
                    rPrev.?.next = null;
                    self.rear.?.prev = null;
                }
                self.rear = rPrev;          // Обновить хвостовой узел
            }
            self.que_size -= 1;              // Обновить длину очереди
            return val;
        } 

        // Извлечение из головы очереди
        pub fn popFirst(self: *Self) T {
            return self.pop(true);
        } 

        // Извлечение из хвоста очереди
        pub fn popLast(self: *Self) T {
            return self.pop(false);
        } 

        // Доступ к элементу в начале очереди
        pub fn peekFirst(self: *Self) T {
            if (self.isEmpty()) @panic("двусторонняя очередь пуста");
            return self.front.?.val;
        }  

        // Доступ к элементу в конце очереди
        pub fn peekLast(self: *Self) T {
            if (self.isEmpty()) @panic("двусторонняя очередь пуста");
            return self.rear.?.val;
        }

        // Вернуть массив для вывода
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
    // Инициализация двусторонней очереди
    var deque = LinkedListDeque(i32){};
    try deque.init(std.heap.page_allocator);
    defer deque.deinit();
    try deque.pushLast(3);
    try deque.pushLast(2);
    try deque.pushLast(5);
    std.debug.print("Двусторонняя очередь deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // Доступ к элементу
    var peek_first = deque.peekFirst();
    std.debug.print("\nЭлемент в начале очереди peek_first = {}", .{peek_first});
    var peek_last = deque.peekLast();
    std.debug.print("\nЭлемент в конце очереди peek_last = {}", .{peek_last});

    // Добавление элемента в очередь
    try deque.pushLast(4);
    std.debug.print("\nПосле добавления элемента 4 в хвост deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    try deque.pushFirst(1);
    std.debug.print("\nПосле добавления элемента 1 в голову deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // Извлечение элемента из очереди
    var pop_last = deque.popLast();
    std.debug.print("\nИзвлечен элемент из хвоста = {}, deque после извлечения из хвоста = ", .{pop_last});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    var pop_first = deque.popFirst();
    std.debug.print("\nИзвлечен элемент из головы = {}, deque после извлечения из головы = ", .{pop_first});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // Получение длины двусторонней очереди
    var size = deque.size();
    std.debug.print("\nДлина двусторонней очереди size = {}", .{size});

    // Проверка, пуста ли двусторонняя очередь
    var is_empty = deque.isEmpty();
    std.debug.print("\nПуста ли двусторонняя очередь = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
