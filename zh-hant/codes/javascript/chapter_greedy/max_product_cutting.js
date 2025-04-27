/**
 * File: max_product_cutting.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大切分乘積：貪婪 */
function maxProductCutting(n) {
    // 當 n <= 3 時，必須切分出一個 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 貪婪地切分出 3 ，a 為 3 的個數，b 為餘數
    let a = Math.floor(n / 3);
    let b = n % 3;
    if (b === 1) {
        // 當餘數為 1 時，將一對 1 * 3 轉化為 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // 當餘數為 2 時，不做處理
        return Math.pow(3, a) * 2;
    }
    // 當餘數為 0 時，不做處理
    return Math.pow(3, a);
}

/* Driver Code */
let n = 58;

// 貪婪演算法
let res = maxProductCutting(n);
console.log(`最大切分乘積為 ${res}`);
