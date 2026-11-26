/**
 * File: max_product_cutting.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Максимальное произведение при разбиении: жадный алгоритм */
function maxProductCutting(n: number): number {
    // При n <= 3 одно из слагаемых обязательно равно 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Выделяем тройки жадно: a — число троек, b — остаток
    let a: number = Math.floor(n / 3);
    let b: number = n % 3;
    if (b === 1) {
        // При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // При остатке 2 ничего не меняем
        return Math.pow(3, a) * 2;
    }
    // При остатке 0 ничего не меняем
    return Math.pow(3, a);
}

/* Пример запуска */
let n: number = 58;

// Жадный алгоритм
let res: number = maxProductCutting(n);
console.log(`Максимальное произведение при разбиении: ${res}`);

export {};
