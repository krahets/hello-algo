/*
 * File: recursion.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* Рекурсия */
fn recur(n: i32) -> i32 {
    // Условие остановки
    if n == 1 {
        return 1;
    }
    // Спуск: рекурсивный вызов
    let res = recur(n - 1);
    // Возврат: передача результата
    n + res
}

/* Моделирование рекурсии с помощью итерации */
fn for_loop_recur(n: i32) -> i32 {
    // Смоделировать стек вызовов с помощью явного стека
    let mut stack = Vec::new();
    let mut res = 0;
    // Спуск: рекурсивный вызов
    for i in (1..=n).rev() {
        // Добавление в стек моделирует спуск
        stack.push(i);
    }
    // Возврат: передача результата
    while !stack.is_empty() {
        // Извлечение из стека моделирует возврат
        res += stack.pop().unwrap();
    }
    // res = 1+2+3+...+n
    res
}

/* Хвостовая рекурсия */
fn tail_recur(n: i32, res: i32) -> i32 {
    // Условие остановки
    if n == 0 {
        return res;
    }
    // Хвостовой рекурсивный вызов
    tail_recur(n - 1, res + n)
}

/* Числа Фибоначчи: рекурсия */
fn fib(n: i32) -> i32 {
    // Базовые случаи: f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1;
    }
    // Рекурсивные вызовы: f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2);
    // Вернуть результат
    res
}

/* Основная программа */
fn main() {
    let n = 5;
    let mut res;

    res = recur(n);
    println!("\nСумма при рекурсии: res = {res}");

    res = for_loop_recur(n);
    println!("\nСумма при итеративном моделировании рекурсии: res = {res}");

    res = tail_recur(n, 0);
    println!("\nСумма при хвостовой рекурсии: res = {res}");

    res = fib(n);
    println!("\nЧисло Фибоначчи с номером {n} равно {res}");
}
