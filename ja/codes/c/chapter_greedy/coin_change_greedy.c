/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* コイン交換：貪欲法 */
int coinChangeGreedy(int *coins, int size, int amt) {
    // coins リストはソート済みと仮定する
    int i = size - 1;
    int count = 0;
    // 残額がなくなるまで貪欲選択を繰り返す
    while (amt > 0) {
        // 残額以下で最も近い硬貨を見つける
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // coins[i] を選択する
        amt -= coins[i];
        count++;
    }
    // 実行可能な解が見つからなければ -1 を返す
    return amt == 0 ? count : -1;
}

/* Driver Code */
int main() {
    // 貪欲法：大域最適解を保証できる
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("%d を作るのに必要な最小硬貨枚数は %d です\n", amt, res);

    // 貪欲法：大域最適解を保証できない
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("%d を作るのに必要な最小硬貨枚数は %d です\n", amt, res);
    printf("実際に必要な最小枚数は 3、つまり 20 + 20 + 20 です\n");

    // 貪欲法：大域最適解を保証できない
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("%d を作るのに必要な最小硬貨枚数は %d です\n", amt, res);
    printf("実際に必要な最小枚数は 2、つまり 49 + 49 です\n");

    return 0;
}
