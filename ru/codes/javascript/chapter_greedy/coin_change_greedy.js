/**
 * File: coin_change_greedy.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Размен монет: жадный алгоритм */
function coinChangeGreedy(coins, amt) {
    // Массив coins предполагается отсортированным
    let i = coins.length - 1;
    let count = 0;
    // Повторяем жадный выбор, пока остаток суммы не обнулится
    while (amt > 0) {
        // Ищем наибольший номинал, не превышающий остаток
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Берём coins[i]
        amt -= coins[i];
        count++;
    }
    // Если решения не нашлось, возвращаем -1
    return amt === 0 ? count : -1;
}

/* Пример запуска */
// Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
let coins = [1, 5, 10, 20, 50, 100];
let amt = 186;
let res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Для суммы ${amt} минимальное число монет: ${res}`);

// Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Для суммы ${amt} минимальное число монет: ${res}`);
console.log('На самом деле минимум — 3 монеты: 20 + 20 + 20');

// Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Для суммы ${amt} минимальное число монет: ${res}`);
console.log('На самом деле минимум — 2 монеты: 49 + 49');
