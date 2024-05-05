/**
 * File: coin_change_greedy.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Coin change: Greedy */
function coinChangeGreedy(coins, amt) {
    // Assuming the coins array is ordered
    let i = coins.length - 1;
    let count = 0;
    // Loop for greedy selection until no remaining amount
    while (amt > 0) {
        // Find the smallest coin close to and less than the remaining amount
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
// Greedy: can ensure finding a global optimal solution
let coins = [1, 5, 10, 20, 50, 100];
let amt = 186;
let res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`凑到 ${amt} 所需的最少硬币数量为 ${res}`);

// Greedy: cannot ensure finding a global optimal solution
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`凑到 ${amt} 所需的最少硬币数量为 ${res}`);
console.log('In reality, the minimum number needed is 3, i.e., 20 + 20 + 20');

// Greedy: cannot ensure finding a global optimal solution
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`凑到 ${amt} 所需的最少硬币数量为 ${res}`);
console.log('In reality, the minimum number needed is 2, i.e., 49 + 49');
