/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 零钱兑换：贪心 */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // 假设 coins 列表有序
    int i = coins.size() - 1;
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
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "凑到 " << amt << " 所需的最少硬币数量为 " << res << endl;

    // 贪心：无法保证找到全局最优解
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "凑到 " << amt << " 所需的最少硬币数量为 " << res << endl;
    cout << "实际上需要的最少数量为 3 ，即 20 + 20 + 20" << endl;

    // 贪心：无法保证找到全局最优解
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "凑到 " << amt << " 所需的最少硬币数量为 " << res << endl;
    cout << "实际上需要的最少数量为 2 ，即 49 + 49" << endl;

    return 0;
}
