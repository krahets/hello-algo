/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* Цикл for */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // Сложить числа 1, 2, ..., n-1, n в цикле
    for i in 1..=n {
        res += i;
    }
    res
}

/* Цикл while */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Задать начальное значение переменной условия

    // Сложить числа 1, 2, ..., n-1, n в цикле
    while i <= n {
        res += i;
        i += 1; // Обновить переменную условия
    }
    res
}

/* Цикл while с двумя обновлениями */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Задать начальное значение переменной условия

    // Сложить числа 1, 4, 10, ... в цикле
    while i <= n {
        res += i;
        // Обновить переменную условия
        i += 1;
        i *= 2;
    }
    res
}

/* Вложенные циклы for */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // Перебрать i = 1, 2, ..., n-1, n
    for i in 1..=n {
        // Перебрать j = 1, 2, ..., n-1, n
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* Основная программа */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nСумма в цикле for: res = {res}");

    res = while_loop(n);
    println!("\nСумма в цикле while: res = {res}");

    res = while_loop_ii(n);
    println!("\nСумма в цикле while с двумя обновлениями: res = {}", res);

    let res = nested_for_loop(n);
    println!("\nРезультат обхода вложенными циклами for: {res}");
}
