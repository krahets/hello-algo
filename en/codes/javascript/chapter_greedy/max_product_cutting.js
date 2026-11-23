/**
 * File: max_product_cutting.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Maximum product after splitting: greedy algorithm */
function maxProductCutting(n) {
    // When n <= 3, one part must be 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
    let a = Math.floor(n / 3);
    let b = n % 3;
    if (b === 1) {
        // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
        return Math.pow(3, a - 1) * 2 * 2;
    }
    if (b === 2) {
        // When the remainder is 2, no adjustment is needed
        return Math.pow(3, a) * 2;
    }
    // When the remainder is 0, no adjustment is needed
    return Math.pow(3, a);
}

/* Driver code */
let n = 58;

// Greedy algorithm
let res = maxProductCutting(n);
console.log(`Maximum product after splitting: ${res}`);
