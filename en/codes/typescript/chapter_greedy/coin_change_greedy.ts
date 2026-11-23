/**
 * File: coin_change_greedy.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Coin change: greedy algorithm */
function coinChangeGreedy(coins: number[], amt: number): number {
    // Assume coins is sorted in ascending order
    let i = coins.length - 1;
    let count = 0;
    // Repeatedly make greedy choices until no amount remains
    while (amt > 0) {
        // Find the largest coin no greater than the remaining amount
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // Choose coins[i]
        amt -= coins[i];
        count++;
    }
    // Return -1 if no feasible solution was found
    return amt === 0 ? count : -1;
}

/* Driver code */
// Greedy algorithm: guaranteed to find a globally optimal solution
let coins: number[] = [1, 5, 10, 20, 50, 100];
let amt: number = 186;
let res: number = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Number of coins chosen by the greedy algorithm to make ${amt}: ${res}`);

// Greedy algorithm: not guaranteed to find a globally optimal solution
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Number of coins chosen by the greedy algorithm to make ${amt}: ${res}`);
console.log('The actual minimum is 3 coins: 20 + 20 + 20');

// Greedy algorithm: not guaranteed to find a globally optimal solution
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`Number of coins chosen by the greedy algorithm to make ${amt}: ${res}`);
console.log('The actual minimum is 2 coins: 49 + 49');

export {};
