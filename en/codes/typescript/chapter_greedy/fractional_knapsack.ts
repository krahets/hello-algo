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

/* Fractional knapsack: greedy algorithm */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // Create a list of items, each with two attributes: weight and value
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
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
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// Greedy algorithm
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`Maximum total item value within the knapsack capacity: ${res}`);

export {};
