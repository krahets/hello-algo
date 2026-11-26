// File: recursion.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// Рекурсивная функция
fn recur(n: i32) i32 {
    // Условие остановки
    if (n == 1) {
        return 1;
    }
    // Спуск: рекурсивный вызов
    const res = recur(n - 1);
    // Возврат: передача результата
    return n + res;
}

// Моделирование рекурсии с помощью итерации
fn forLoopRecur(comptime n: i32) i32 {
    // Смоделировать стек вызовов с помощью явного стека
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // Спуск: рекурсивный вызов
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // Возврат: передача результата
    var index: usize = n;
    while (index > 0) {
        index -= 1;
        res += stack[index];
    }
    // res = 1+2+3+...+n
    return res;
}

// Функция с хвостовой рекурсией
fn tailRecur(n: i32, res: i32) i32 {
    // Условие остановки
    if (n == 0) {
        return res;
    }
    // Хвостовой рекурсивный вызов
    return tailRecur(n - 1, res + n);
}

// Последовательность Фибоначчи
fn fib(n: i32) i32 {
    // Базовые случаи: f(1) = 0, f(2) = 1
    if (n == 1 or n == 2) {
        return n - 1;
    }
    // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
    const res: i32 = fib(n - 1) + fib(n - 2);
    // Вернуть результат f(n)
    return res;
}

// Основная программа
pub fn run() void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("Сумма при рекурсии: res = {}\n", .{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("Сумма при итеративном моделировании рекурсии: res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("Сумма при хвостовой рекурсии: res = {}\n", .{tailRecur(n, 0)});

    res = fib(n);
    std.debug.print("Число Фибоначчи с номером {} равно {}\n", .{ n, fib(n) });

    std.debug.print("\n", .{});
}

pub fn main() void {
    run();
}

test "recursion" {
    run();
}
