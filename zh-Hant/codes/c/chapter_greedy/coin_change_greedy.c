/**
 * File: coin_change_greedy.c
 * Created Time: 2023-09-07
 * Author: lwbaptx (lwbaptx@gmail.com)
 */

#include "../utils/common.h"

/* 零钱兑换：贪心 */
int coinChangeGreedy(int *coins, int size, int amt) {
    // 假设 coins 列表有序
    int i = size - 1;
    int count = 0;
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
    return amt == 0 ? count : -1;
}

/* Driver Code */
int main() {
    // 贪心：能够保证找到全局最优解
    int coins1[6] = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins1, 6, amt);
    printf("\ncoins = ");
    printArray(coins1, 6);
    printf("amt = %d\n", amt);
    printf("凑到 %d 所需的最少硬币数量为 %d\n", amt, res);

    // 贪心：无法保证找到全局最优解
    int coins2[3] = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins2, 3, amt);
    printf("\ncoins = ");
    printArray(coins2, 3);
    printf("amt = %d\n", amt);
    printf("凑到 %d 所需的最少硬币数量为 %d\n", amt, res);
    printf("实际上需要的最少数量为 3 ，即 20 + 20 + 20\n");

    // 贪心：无法保证找到全局最优解
    int coins3[3] = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins3, 3, amt);
    printf("\ncoins = ");
    printArray(coins3, 3);
    printf("amt = %d\n", amt);
    printf("凑到 %d 所需的最少硬币数量为 %d\n", amt, res);
    printf("实际上需要的最少数量为 2 ，即 49 + 49\n");

    return 0;
}
