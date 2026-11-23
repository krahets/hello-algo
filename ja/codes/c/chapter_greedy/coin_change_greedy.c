/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* 硬貨の両替：貪欲法 */
int coinChangeGreedy(int *coins, int size, int amt) {
    // coins リストはソート済みと仮定する
    int i = size - 1;
    int count = 0;
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
    return amt == 0 ? count : -1;
}

/* 実行用コード */
int main() {
    // 貪欲法：大域的最適解が得られることを保証できる
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("%d にするために必要な硬貨の最小枚数は %d\n", amt, res);

    // 貪欲法：大域的最適解が得られることを保証できない
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("%d にするために必要な硬貨の最小枚数は %d\n", amt, res);
    printf("実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20\n");

    // 貪欲法：大域的最適解が得られることを保証できない
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("%d にするために必要な硬貨の最小枚数は %d\n", amt, res);
    printf("実際に必要な最小枚数は 2 、すなわち 49 + 49\n");

    return 0;
}
