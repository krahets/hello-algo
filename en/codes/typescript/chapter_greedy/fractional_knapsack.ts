/**
 * File: fractional_knapsack.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Item */
class Item {
    w: number; // Item weight
    v: number; // Item value

    constructor(w: number, v: number) {
        this.w = w;
        this.v = v;
    }
}

/* Fractional knapsack: Greedy algorithm */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // Create item list with two attributes: weight, value
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
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
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// Greedy algorithm
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

export {};
