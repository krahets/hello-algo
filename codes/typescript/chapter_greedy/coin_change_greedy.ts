/**
 * File: coin_change_greedy.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 零钱兑换：贪心 */
function coinChangeGreedy(coins: number[], amt: number): number {
    // 假设 coins 数组有序
    let i = coins.length - 1;
    let count = 0;
    // 循环进行贪心选择，直到无剩余金额
    while (amt > 0) {
        // 找到小于且最接近剩余金额的硬币
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // 选择 coins[i]
        amt -= coins[i];
        count++;
    }
    // 若未找到可行方案，则返回 -1
    return amt === 0 ? count : -1;
}

/* Driver Code */
// 贪心：能够保证找到全局最优解
let coins: number[] = [1, 5, 10, 20, 50, 100];
let amt: number = 186;
let res: number = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`凑到 ${amt} 所需的最少硬币数量为 ${res}`);

// 贪心：无法保证找到全局最优解
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`凑到 ${amt} 所需的最少硬币数量为 ${res}`);
console.log('实际上需要的最少数量为 3 ，即 20 + 20 + 20');

// 贪心：无法保证找到全局最优解
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`凑到 ${amt} 所需的最少硬币数量为 ${res}`);
console.log('实际上需要的最少数量为 2 ，即 49 + 49');

export {};
