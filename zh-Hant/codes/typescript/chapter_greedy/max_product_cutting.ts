/**
 * File: max_product_cutting.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 最大切分乘积：贪心 */
function maxProductCutting(n: number): number {
    // 当 n <= 3 时，必须切分出一个 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
    let a: number = Math.floor(n / 3);
    let b: number = n % 3;
    if (b === 1) {
        // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // 当余数为 2 时，不做处理
        return Math.pow(3, a) * 2;
    }
    // 当余数为 0 时，不做处理
    return Math.pow(3, a);
}

/* Driver Code */
let n: number = 58;

// 贪心算法
let res: number = maxProductCutting(n);
console.log(`最大切分乘积为 ${res}`);

export {};
