/**
 * File: max_capacity.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Max capacity: Greedy algorithm */
function maxCapacity(ht: number[]): number {
    // Initialize i, j to be at both ends of the array
    let i = 0,
        j = ht.length - 1;
    // Initial max capacity is 0
    let res = 0;
    // Loop for greedy selection until the two boards meet
    while (i < j) {
        // Update max capacity
        const cap: number = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // Move the shorter board inward
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Driver Code */
const ht: number[] = [3, 8, 5, 2, 7, 7, 3, 4];

// Greedy algorithm
const res: number = maxCapacity(ht);
console.log(`Maximum capacity is ${res}`);

export {};
