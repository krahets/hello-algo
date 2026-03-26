/**
 * File: max_product_cutting.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Максимальное произведение разбиения: жадный алгоритм */
function maxProductCutting(n) {
    // Когда n <= 3, необходимо отделить одну 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Жадно выделить части по 3, где a — число троек, а b — остаток
    let a = Math.floor(n / 3);
    let b = n % 3;
    if (b === 1) {
        // Когда остаток равен 1, преобразовать пару 1 * 3 в 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // Когда остаток равен 2, ничего делать не нужно
        return Math.pow(3, a) * 2;
    }
    // Когда остаток равен 0, ничего делать не нужно
    return Math.pow(3, a);
}

/* Driver Code */
let n = 58;

// Жадный алгоритм
let res = maxProductCutting(n);
console.log(`максимальное произведение разбиенияравно ${res}`);
