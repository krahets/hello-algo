/**
 * File: coin_change_greedy.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Coin change: Greedy algorithm */
function coinChangeGreedy(coins: number[], amt: number): number {
    // Assume coins array is sorted
    let i = coins.length - 1;
    let count = 0;
    // Loop to make greedy choices until no remaining amount
    while (amt > 0) {
        // Find the coin that is less than and closest to the remaining amount
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Choose coins[i]
        amt -= coins[i];
        count++;
    }
    // If no feasible solution is found, return -1
    return amt === 0 ? count : -1;
}

/* Driver Code */
// Greedy algorithm: Can guarantee finding the global optimal solution
let coins: number[] = [1, 5, 10, 20, 50, 100];
let amt: number = 186;
let res: number = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Minimum coins needed to make ${amt} is ${res}`);

// Greedy algorithm: Cannot guarantee finding the global optimal solution
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Minimum coins needed to make ${amt} is ${res}`);
console.log('Actually the minimum number needed is 3, i.e., 20 + 20 + 20');

// Greedy algorithm: Cannot guarantee finding the global optimal solution
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Minimum coins needed to make ${amt} is ${res}`);
console.log('Actually the minimum number needed is 2, i.e., 49 + 49');

export {};
