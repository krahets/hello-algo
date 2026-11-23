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

/* Fractional knapsack: greedy algorithm */
function fractionalKnapsack(wgt, val, cap) {
    // Create a list of items, each with two attributes: weight and value
    const items = wgt.map((w, i) => new Item(w, val[i]));
    // Sort by value per unit weight, item.v / item.w, in descending order
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // Repeatedly make greedy choices
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // If enough capacity remains, put the entire current item in the knapsack
            res += item.v;
            cap -= item.w;
        } else {
            // If the remaining capacity is insufficient, put part of the current item in the knapsack
            res += (item.v / item.w) * cap;
            // No capacity remains, so exit the loop
            break;
        }
    }
    return res;
}

/* Driver code */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Greedy algorithm
const res = fractionalKnapsack(wgt, val, cap);
console.log(`Maximum item value within the knapsack capacity: ${res}`);
