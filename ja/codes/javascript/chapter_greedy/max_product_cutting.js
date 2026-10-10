/**
 * File: max_product_cutting.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大切断積：貪欲法 */
function maxProductCutting(n) {
    // n <= 3 のときは、必ず 1 を切り出す
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
    let a = Math.floor(n / 3);
    let b = n % 3;
    if (b === 1) {
        // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // 余りが 2 のときは、そのままにする
        return Math.pow(3, a) * 2;
    }
    // 余りが 0 のときは、そのままにする
    return Math.pow(3, a);
}

/* Driver Code */
let n = 58;

// 貪欲法
let res = maxProductCutting(n);
console.log(`最大分割積は ${res}`);
