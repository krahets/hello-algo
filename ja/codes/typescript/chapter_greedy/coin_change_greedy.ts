/**
 * File: coin_change_greedy.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* 硬貨の両替：貪欲法 */
function coinChangeGreedy(coins: number[], amt: number): number {
    // coins 配列はソート済みと仮定する
    let i = coins.length - 1;
    let count = 0;
    // 残額がなくなるまで貪欲な選択を繰り返す
    while (amt > 0) {
        // 残額より小さく、残額に最も近い硬貨を探す
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // coins[i] を選ぶ
        amt -= coins[i];
        count++;
    }
    // 実行可能な方法が見つからなかった場合、-1 を返す
    return amt === 0 ? count : -1;
}

/* 実行用コード */
// 貪欲法：大域的最適解が得られることを保証できる
let coins: number[] = [1, 5, 10, 20, 50, 100];
let amt: number = 186;
let res: number = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`${amt} にするために必要な硬貨の最小枚数は ${res}`);

// 貪欲法：大域的最適解が得られることを保証できない
coins = [1, 20, 50];
amt = 60;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`${amt} にするために必要な硬貨の最小枚数は ${res}`);
console.log('実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20');

// 貪欲法：大域的最適解が得られることを保証できない
coins = [1, 49, 50];
amt = 98;
res = coinChangeGreedy(coins, amt);
console.log(`\ncoins = ${coins}, amt = ${amt}`);
console.log(`${amt} にするために必要な硬貨の最小枚数は ${res}`);
console.log('実際に必要な最小枚数は 2 、すなわち 49 + 49');

export {};
