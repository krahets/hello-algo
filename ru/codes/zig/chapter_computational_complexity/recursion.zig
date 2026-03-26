// File: recursion.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// Рекурсивная функция
fn recur(n: i32) i32 {
    // Условие завершения
    if (n == 1) {
        return 1;
    }
    // Рекурсивный шаг: выполнить рекурсивный вызов
    const res = recur(n - 1);
    // Шаг возврата: вернуть результат
    return n + res;
}

// Имитировать рекурсию с помощью итерации
fn forLoopRecur(comptime n: i32) i32 {
    // Использовать явный стек для имитации системного стека вызовов
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // Рекурсивный шаг: выполнить рекурсивный вызов
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // Шаг возврата: вернуть результат
    var index: usize = n;
    while (index > 0) {
        index -= 1;
        res += stack[index];
    }
    // res = 1+2+3+...+n
    return res;
}

// Хвостовая Рекурсивная функция
fn tailRecur(n: i32, res: i32) i32 {
    // Условие завершения
    if (n == 0) {
        return res;
    }
    // Вызов хвостовой рекурсии
    return tailRecur(n - 1, res + n);
}

// Последовательность Фибоначчи
fn fib(n: i32) i32 {
    // Условие завершения: f(1) = 0, f(2) = 1
    if (n == 1 or n == 2) {
        return n - 1;
    }
    // Рекурсивный вызов f(n) = f(n-1) + f(n-2)
    const res: i32 = fib(n - 1) + fib(n - 2);
    // Вернуть результат f(n)
    return res;
}

// Driver Code
pub fn run() void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("Результат суммирования рекурсивной функции res = {}\n",.{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("Результат суммирования при имитации рекурсии итерацией res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("Результат суммирования хвостовой рекурсией res = {}\n",.{tailRecur(n, 0)});

    res = fib(n);
    std.debug.print("{}-й элемент последовательности Фибоначчи равен {}\n",.{ n, fib(n) });

    std.debug.print("\n", .{});
}

pub fn main() void {
    run();
}

test "recursion" {
    run();
}
