/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* 硬貨の両替（貪欲法） */
int coinChangeGreedy(int *coins, int size, int amt) {
    // リスト coins はソート済みとする
    int i = size - 1;
    int count = 0;
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
    return amt == 0 ? count : -1;
}

/* 実行例 */
int main() {
    // 貪欲法で大域的最適解が必ず求まる例
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("金額 %d を作るのに必要な硬貨の最少枚数は %d 枚\n", amt, res);

    // 貪欲法では大域的最適解を保証できない例
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("金額 %d を作るのに必要な硬貨の最少枚数は %d 枚\n", amt, res);
    printf("実際の最少枚数は 3 枚（20 + 20 + 20）\n");

    // 貪欲法では大域的最適解を保証できない例
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("金額 %d を作るのに必要な硬貨の最少枚数は %d 枚\n", amt, res);
    printf("実際の最少枚数は 2 枚（49 + 49）\n");

    return 0;
}
