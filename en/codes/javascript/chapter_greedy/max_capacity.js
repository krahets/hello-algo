/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Greedy maximum capacity algorithm */
function maxCapacity(ht) {
    // Start i and j at opposite ends of the array
    let i = 0,
        j = ht.length - 1;
    // The initial maximum capacity is 0
    let res = 0;
    // Make greedy choices until the two pointers meet
    while (i < j) {
        // Update the maximum capacity
        const cap = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // Move the pointer at the shorter board inward
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Driver code */
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// Greedy algorithm
const res = maxCapacity(ht);
console.log(`The maximum capacity is ${res}`);
