/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Размен монет: жадный алгоритм */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // Список coins предполагается отсортированным
    let mut i = coins.len() - 1;
    let mut count = 0;
    // Повторяем жадный выбор, пока остаток суммы не обнулится
    while amt > 0 {
        // Ищем наибольший номинал, не превышающий остаток
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // Берём coins[i]
        amt -= coins[i];
        count += 1;
    }
    // Если решения не нашлось, возвращаем -1
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* Пример запуска */
fn main() {
    // Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Для суммы {} минимальное число монет: {}", amt, res);

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Для суммы {} минимальное число монет: {}", amt, res);
    println!("На самом деле минимум — 3 монеты: 20 + 20 + 20");

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Для суммы {} минимальное число монет: {}", amt, res);
    println!("На самом деле минимум — 2 монеты: 49 + 49");
}
