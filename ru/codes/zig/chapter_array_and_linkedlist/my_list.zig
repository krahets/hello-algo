// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Класс списка
const MyList = struct {
    const Self = @This();

    items: []i32, // Массив (для хранения элементов списка)
    capacity: usize, // Вместимость списка
    allocator: std.mem.Allocator, // Аллокатор памяти

    extend_ratio: usize = 2, // Коэффициент увеличения списка при каждом расширении

    // Конструктор (выделение памяти + инициализация списка)
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // Деструктор (освобождение памяти)
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // Добавление элемента в конец
    pub fn add(self: *Self, item: i32) !void {
        // При превышении вместимости по числу элементов запускается расширение
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // Обновление элемента
        self.items.len += 1;
        const new_item_ptr = &self.items[self.items.len - 1];
        new_item_ptr.* = item;
    }

    // Получить длину списка (текущее число элементов)
    pub fn getSize(self: *Self) usize {
        return self.items.len;
    }

    // Получить вместимость списка
    pub fn getCapacity(self: *Self) usize {
        return self.capacity;
    }

    // Доступ к элементу
    pub fn get(self: *Self, index: usize) i32 {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 or index >= self.items.len) {
            @panic("индекс выходит за границы");
        }
        return self.items[index];
    }

    // Обновление элемента
    pub fn set(self: *Self, index: usize, num: i32) void {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 or index >= self.items.len) {
            @panic("индекс выходит за границы");
        }
        self.items[index] = num;
    }

    // Вставка элемента в середину
    pub fn insert(self: *Self, index: usize, item: i32) !void {
        if (index < 0 or index >= self.items.len) {
            @panic("индекс выходит за границы");
        }

        // При превышении вместимости по числу элементов запускается расширение
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        self.items.len += 1;
        var i = self.items.len - 1;
        while (i >= index) : (i -= 1) {
            self.items[i] = self.items[i - 1];
        }
        self.items[index] = item;
    }

    // Удаление элемента
    pub fn remove(self: *Self, index: usize) i32 {
        if (index < 0 or index >= self.getSize()) {
            @panic("индекс выходит за границы");
        }
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // Вернуть удаленный элемент
        return item;
    }

    // Преобразовать список в массив
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // Вернуть новый срез и указать, нужно ли сбросить или очистить контейнер списка
    pub fn toOwnedSlice(self: *Self, clear: bool) ![]i32 {
        const allocator = self.allocator;
        const old_memory = self.allocatedSlice();
        if (allocator.remap(old_memory, self.items.len)) |new_items| {
            if (clear) {
                self.* = init(allocator);
            }
            return new_items;
        }

        const new_memory = try allocator.alloc(i32, self.items.len);
        @memcpy(new_memory, self.items);
        if (clear) {
            self.clearAndFree();
        }
        return new_memory;
    }

    // Расширение списка
    fn ensureTotalCapacity(self: *Self, new_capacity: usize) !void {
        if (self.capacity >= new_capacity) return;
        const capcacity = if (self.capacity == 0) 10 else self.capacity;
        const better_capacity = capcacity * self.extend_ratio;

        const old_memory = self.allocatedSlice();
        if (self.allocator.remap(old_memory, better_capacity)) |new_memory| {
            self.items.ptr = new_memory.ptr;
            self.capacity = new_memory.len;
        } else {
            const new_memory = try self.allocator.alloc(i32, better_capacity);
            @memcpy(new_memory[0..self.items.len], self.items);
            self.allocator.free(old_memory);
            self.items.ptr = new_memory.ptr;
            self.capacity = new_memory.len;
        }
    }

    fn clearAndFree(self: *Self, allocator: std.mem.Allocator) void {
        allocator.free(self.allocatedSlice());
        self.items.len = 0;
        self.capacity = 0;
    }

    fn allocatedSlice(self: Self) []i32 {
        return self.items.ptr[0..self.capacity];
    }
};

// Driver Code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Инициализация списка
    var nums = MyList.init(allocator);
    // Отложенное освобождение памяти
    defer nums.deinit();

    // Добавление элемента в конец
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("Список nums = {}, вместимость = {}, длина = {}\n", .{\n    utils.fmt.slice(nums.items),\n    nums.getCapacity(),\n    nums.getSize(),\n});

    // Вставка элемента в середину
    try nums.insert(3, 6);
    std.debug.print(
        "После вставки числа 6 по индексу 3 получаем nums = {}\n",\n    .{utils.fmt.slice(nums.items)},\n);

    // Удаление элемента
    _ = nums.remove(3);
    std.debug.print(
        "После удаления элемента по индексу 3 получаем nums = {}\n",\n    .{utils.fmt.slice(nums.items)},\n);

    // Доступ к элементу
    const num = nums.get(1);
    std.debug.print("Элемент по индексу 1: num = {}\n", .{num});

    // Обновление элемента
    nums.set(1, 0);
    std.debug.print(
        "После обновления элемента по индексу 1 значением 0 получаем nums = {}\n",\n    .{utils.fmt.slice(nums.items)},\n);

    // Проверка механизма расширения
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
        try nums.add(i);
    }
    std.debug.print(
        "Список nums после увеличения вместимости = {}, вместимость = {}, длина = {}\n",\n    .{\n        utils.fmt.slice(nums.items),\n        nums.getCapacity(),\n        nums.getSize(),\n    },\n);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "my_list" {
    try run();
}
