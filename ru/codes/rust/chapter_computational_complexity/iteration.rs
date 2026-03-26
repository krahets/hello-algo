/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* Цикл for */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    for i in 1..=n {
        res += i;
    }
    res
}

/* Цикл while */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Инициализировать управляющую переменную

    // В цикле вычислить сумму 1, 2, ..., n-1, n
    while i <= n {
        res += i;
        i += 1; // Обновить управляющую переменную
    }
    res
}

/* Цикл while (с двумя обновлениями) */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // Инициализировать управляющую переменную

    // В цикле вычислить сумму 1, 4, 10, ...
    while i <= n {
        res += i;
        // Обновить управляющую переменную
        i += 1;
        i *= 2;
    }
    res
}

/* Двойной цикл for */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // Цикл i = 1, 2, ..., n-1, n
    for i in 1..=n {
        // Цикл j = 1, 2, ..., n-1, n
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* Driver Code */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nРезультат суммирования в цикле for res = {res}");

    res = while_loop(n);
    println!("\nРезультат суммирования в цикле while res = {res}");

    res = while_loop_ii(n);
    println!("\nЦикл while (с двумя обновлениями)результат суммирования res = {}", res);

    let res = nested_for_loop(n);
    println!("\nРезультат обхода двойным циклом for {res}");
}
