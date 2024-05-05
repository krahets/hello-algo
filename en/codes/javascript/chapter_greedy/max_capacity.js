/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Maximum capacity: Greedy */
function maxCapacity(ht) {
    // Initialize i, j, making them split the array at both ends
    let i = 0,
        j = ht.length - 1;
    // Initial maximum capacity is 0
    let res = 0;
    // Loop for greedy selection until the two boards meet
    while (i < j) {
        // Update maximum capacity
        const cap = Math.min(ht[i], ht[j]) * (j - i);
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
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// Greedy algorithm
const res = maxCapacity(ht);
console.log(`最大容量为 ${res}`);
