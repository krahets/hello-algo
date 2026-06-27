/**
 * File: max_product_cutting.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Max product cutting: Greedy algorithm */
function maxProductCutting(n: number): number {
    // When n <= 3, must cut out a 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Greedily cut out 3, a is the number of 3s, b is the remainder
    let a: number = Math.floor(n / 3);
    let b: number = n % 3;
    if (b === 1) {
        // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // When the remainder is 2, do nothing
        return Math.pow(3, a) * 2;
    }
    // When the remainder is 0, do nothing
    return Math.pow(3, a);
}

/* Driver Code */
let n: number = 58;

// Greedy algorithm
let res: number = maxProductCutting(n);
console.log(`Maximum cutting product is ${res}`);

export {};
