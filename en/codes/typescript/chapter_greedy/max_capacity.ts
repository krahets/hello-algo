/**
 * File: max_capacity.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Maximum container capacity: greedy algorithm */
function maxCapacity(ht: number[]): number {
    // Initialize i and j at opposite ends of the array
    let i = 0,
        j = ht.length - 1;
    // The initial maximum capacity is 0
    let res = 0;
    // Repeatedly make greedy choices until the two sides meet
    while (i < j) {
        // Update the maximum capacity
        const cap: number = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // Move the shorter side inward
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Driver code */
const ht: number[] = [3, 8, 5, 2, 7, 7, 3, 4];

// Greedy algorithm
const res: number = maxCapacity(ht);
console.log(`Maximum capacity: ${res}`);

export {};
