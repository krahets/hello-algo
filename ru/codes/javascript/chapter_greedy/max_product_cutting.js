/**
 * File: max_product_cutting.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Максимальное произведение разрезания: жадный алгоритм */
function maxProductCutting(n) {
    // Когда n <= 3, обязательно нужно выделить одну 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Жадно выделить множители 3, где a — число троек, а b — остаток
    let a = Math.floor(n / 3);
    let b = n % 3;
    if (b === 1) {
        // Если остаток равен 1, преобразовать одну пару 1 * 3 в 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // Если остаток равен 2, ничего не делать
        return Math.pow(3, a) * 2;
    }
    // Если остаток равен 0, ничего не делать
    return Math.pow(3, a);
}

/* Driver Code */
let n = 58;

// Жадный алгоритм
let res = maxProductCutting(n);
console.log(`Максимальное произведение после разрезания = ${res}`);
