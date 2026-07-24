/**
 * File: coin_change_greedy.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代C++、const正确性、类型安全、规范命名
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 零钱兑换：贪心 */
int coinChangeGreedy(const std::vector<int>& coins, int amt) {
    // 硬币数组必须是升序排列
    int i = static_cast<int>(coins.size()) - 1;
    int count = 0;

    // 循环进行贪心选择，直到无剩余金额
    while (amt > 0) {
        // 找到小于且最接近剩余金额的硬币
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // 选择当前最大硬币
        amt -= coins[i];
        count++;
    }

    // 若未找到可行方案，则返回 -1
    return amt == 0 ? count : -1;
}

/* Driver Code */
int main() {
    // 贪心：能够保证找到全局最优解
    std::vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    std::cout << "\ncoins = ";
    printVector(coins);
    std::cout << "amt = " << amt << '\n';
    std::cout << "凑到 " << amt << " 所需的最少硬币数量为 " << res << '\n';

    // 贪心：无法保证找到全局最优解
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    std::cout << "\ncoins = ";
    printVector(coins);
    std::cout << "amt = " << amt << '\n';
    std::cout << "凑到 " << amt << " 所需的最少硬币数量为 " << res << '\n';
    std::cout << "实际上需要的最少数量为 3 ，即 20 + 20 + 20\n";

    // 贪心：无法保证找到全局最优解
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    std::cout << "\ncoins = ";
    printVector(coins);
    std::cout << "amt = " << amt << '\n';
    std::cout << "凑到 " << amt << " 所需的最少硬币数量为 " << res << '\n';
    std::cout << "实际上需要的最少数量为 2 ，即 49 + 49\n";

    return 0;
}
