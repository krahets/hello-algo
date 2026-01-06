/**
 * File: fractional_knapsack.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Item */
class Item {
    constructor(w, v) {
        this.w = w; // Item weight
        this.v = v; // Item value
    }
}

/* Fractional knapsack: Greedy algorithm */
function fractionalKnapsack(wgt, val, cap) {
    // Create item list with two attributes: weight, value
    const items = wgt.map((w, i) => new Item(w, val[i]));
    // Sort by unit value item.v / item.w from high to low
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // Loop for greedy selection
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // If remaining capacity is sufficient, put the entire current item into the knapsack
            res += item.v;
            cap -= item.w;
        } else {
            // If remaining capacity is insufficient, put part of the current item into the knapsack
            res += (item.v / item.w) * cap;
            // No remaining capacity, so break out of the loop
            break;
        }
    }
    return res;
}

/* Driver Code */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Greedy algorithm
const res = fractionalKnapsack(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);
