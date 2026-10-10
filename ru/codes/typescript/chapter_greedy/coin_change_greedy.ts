/**
 * File: coin_change_greedy.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Размен монет: жадный алгоритм */
function coinChangeGreedy(coins: number[], amt: number): number {
    // Предположить, что массив coins упорядочен
    let i = coins.length - 1;
    let count = 0;
    // Циклически выполнять жадный выбор, пока не останется суммы
    while (amt > 0) {
        // Найти монету, которая меньше остатка суммы и наиболее к нему близка
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Выбрать coins[i]
        amt -= coins[i];
        count++;
    }
    // Если допустимое решение не найдено, вернуть -1
    return amt === 0 ? count : -1;
}

/* Driver Code */
// Жадный подход: гарантирует нахождение глобально оптимального решения
let coins: number[] = [1, 5, 10, 20, 50, 100];
let amt: number = 186;
let res: number = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Минимальное число монет для набора суммы ${amt} = ${res}`);

// Жадный подход: не гарантирует нахождение глобально оптимального решения
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Минимальное число монет для набора суммы ${amt} = ${res}`);
console.log('На самом деле минимум равен 3: 20 + 20 + 20');

// Жадный подход: не гарантирует нахождение глобально оптимального решения
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Минимальное число монет для набора суммы ${amt} = ${res}`);
console.log('На самом деле минимум равен 2: 49 + 49');

export {};
