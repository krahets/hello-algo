/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* 零錢兌換：貪婪 */
int coinChangeGreedy(int *coins, int size, int amt) {
    // 假設 coins 串列有序
    int i = size - 1;
    int count = 0;
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
    return amt == 0 ? count : -1;
}

/* Driver Code */
int main() {
    // 貪婪：能夠保證找到全域性最優解
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("湊到 %d 所需的最少硬幣數量為 %d\n", amt, res);

    // 貪婪：無法保證找到全域性最優解
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("湊到 %d 所需的最少硬幣數量為 %d\n", amt, res);
    printf("實際上需要的最少數量為 3 ，即 20 + 20 + 20\n");

    // 貪婪：無法保證找到全域性最優解
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("湊到 %d 所需的最少硬幣數量為 %d\n", amt, res);
    printf("實際上需要的最少數量為 2 ，即 49 + 49\n");

    return 0;
}
