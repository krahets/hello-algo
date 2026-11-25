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

/* Greedy fractional knapsack */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // Create a list of items, each with a weight and a value
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
    // Sort by value per unit of weight, item.v / item.w, in descending order
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // Make greedy choices in a loop
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // If the whole item fits, put it in the knapsack
            res += item.v;
            cap -= item.w;
        } else {
            // If the whole item does not fit, take a fraction of it
            res += (item.v / item.w) * cap;
            // The knapsack is full, so exit the loop
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
console.log(`The maximum total value within the weight limit is ${res}`);

export {};
