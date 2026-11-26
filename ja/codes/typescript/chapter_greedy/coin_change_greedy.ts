/**
 * File: coin_change_greedy.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 硬貨の両替（貪欲法） */
function coinChangeGreedy(coins: number[], amt: number): number {
    // 配列 coins はソート済みとする
    let i = coins.length - 1;
    let count = 0;
    // 残額がなくなるまで貪欲選択を繰り返す
    while (amt > 0) {
        // 残額以下で額面が最大の硬貨を探す
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // coins[i] を選ぶ
        amt -= coins[i];
        count++;
    }
    // 解が見つからなければ -1 を返す
    return amt === 0 ? count : -1;
}

/* 実行例 */
// 貪欲法で大域的最適解が必ず求まる例
let coins: number[] = [1, 5, 10, 20, 50, 100];
let amt: number = 186;
let res: number = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`金額 ${amt} を作るのに必要な硬貨の最少枚数は ${res}`);

// 貪欲法では大域的最適解を保証できない例
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`金額 ${amt} を作るのに必要な硬貨の最少枚数は ${res}`);
console.log('実際の最少枚数は 3 枚（20 + 20 + 20）');

// 貪欲法では大域的最適解を保証できない例
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`金額 ${amt} を作るのに必要な硬貨の最少枚数は ${res}`);
console.log('実際の最少枚数は 2 枚（49 + 49）');

export {};
