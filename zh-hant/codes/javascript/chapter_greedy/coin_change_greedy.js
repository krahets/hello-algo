/**
 * File: coin_change_greedy.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 零錢兌換：貪婪 */
function coinChangeGreedy(coins, amt) {
    // 假設 coins 陣列有序
    let i = coins.length - 1;
    let count = 0;
    // 迴圈進行貪婪選擇，直到無剩餘金額
    while (amt > 0) {
        // 找到小於且最接近剩餘金額的硬幣
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // 選擇 coins[i]
        amt -= coins[i];
        count++;
    }
    // 若未找到可行方案，則返回 -1
    return amt === 0 ? count : -1;
}

/* Driver Code */
// 貪婪：能夠保證找到全域性最優解
let coins = [1, 5, 10, 20, 50, 100];
let amt = 186;
let res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`湊到 ${amt} 所需的最少硬幣數量為 ${res}`);

// 貪婪：無法保證找到全域性最優解
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`湊到 ${amt} 所需的最少硬幣數量為 ${res}`);
console.log('實際上需要的最少數量為 3 ，即 20 + 20 + 20');

// 貪婪：無法保證找到全域性最優解
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`湊到 ${amt} 所需的最少硬幣數量為 ${res}`);
console.log('實際上需要的最少數量為 2 ，即 49 + 49');
