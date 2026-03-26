/*
 * File: coin_change_greedy.rs
 * Created Time: 2023-07-22
 * Author: night-cruise (2586447362@qq.com)
 */

/* Размен монет: жадный алгоритм */
fn coin_change_greedy(coins: &[i32], mut amt: i32) -> i32 {
    // Предположим, что список coins упорядочен
    let mut i = coins.len() - 1;
    let mut count = 0;
    // Повторять жадный выбор, пока не останется суммы
    while amt > 0 {
        // Найти монету, которая меньше оставшейся суммы и ближе всего к ней
        while i > 0 && coins[i] > amt {
            i -= 1;
        }
        // Выбрать coins[i]
        amt -= coins[i];
        count += 1;
    }
    // Если допустимое решение не найдено, вернуть -1
    if amt == 0 {
        count
    } else {
        -1
    }
}

/* Driver Code */
fn main() {
    // Жадный подход: позволяет гарантированно найти глобально оптимальное решение
    let coins = [1, 5, 10, 20, 50, 100];
    let amt = 186;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Для получения {} минимальное число монет равно {}", amt, res);

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    let coins = [1, 20, 50];
    let amt = 60;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Для получения {} минимальное число монет равно {}", amt, res);
    println!("Фактически минимальное необходимое количество равно 3, то есть 20 + 20 + 20");

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    let coins = [1, 49, 50];
    let amt = 98;
    let res = coin_change_greedy(&coins, amt);
    println!("\ncoins = {:?}, amt = {}", coins, amt);
    println!("Для получения {} минимальное число монет равно {}", amt, res);
    println!("Фактически минимальное необходимое количество равно 2, то есть 49 + 49");
}
