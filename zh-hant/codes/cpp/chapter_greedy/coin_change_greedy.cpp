/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 零錢兌換：貪婪法 */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // 假設硬幣清單 coins 已依面額遞增排序
    int i = coins.size() - 1;
    int count = 0;
    // 反覆依貪婪策略選取硬幣，直到剩餘金額為零
    while (amt > 0) {
        // 找出面額小於且最接近剩餘金額的硬幣
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // 選取 coins[i]
        amt -= coins[i];
        count++;
    }
    // 若找不到可行解，則回傳 -1
    return amt == 0 ? count : -1;
}

/* 主程式 */
int main() {
    // 貪婪法：保證能找到全域最佳解
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "湊出 " << amt << " 所需的最少硬幣數為 " << res << endl;

    // 貪婪法：無法保證找到全域最佳解
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "湊出 " << amt << " 所需的最少硬幣數為 " << res << endl;
    cout << "實際上最少只需 3 枚，即 20 + 20 + 20" << endl;

    // 貪婪法：無法保證找到全域最佳解
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << "湊出 " << amt << " 所需的最少硬幣數為 " << res << endl;
    cout << "實際上最少只需 2 枚，即 49 + 49" << endl;

    return 0;
}
