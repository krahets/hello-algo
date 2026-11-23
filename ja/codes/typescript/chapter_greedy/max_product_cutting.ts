/**
 * File: max_product_cutting.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 分割後の積の最大化：貪欲法 */
function maxProductCutting(n: number): number {
    // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
    let a: number = Math.floor(n / 3);
    let b: number = n % 3;
    if (b === 1) {
        // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // 余りが 2 の場合、何もしない
        return Math.pow(3, a) * 2;
    }
    // 余りが 0 の場合、何もしない
    return Math.pow(3, a);
}

/* 実行用コード */
let n: number = 58;

// 貪欲アルゴリズム
let res: number = maxProductCutting(n);
console.log(`分割後の積の最大値は ${res}`);

export {};
