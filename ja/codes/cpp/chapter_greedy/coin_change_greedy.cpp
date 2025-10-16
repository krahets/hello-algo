/**
 * File: coin_change_greedy.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 硬貨両替：貪欲法 */
int coinChangeGreedy(vector<int> &coins, int amt) {
    // 硬貨リストが順序付けされていると仮定
    int i = coins.size() - 1;
    int count = 0;
    // 残り金額がなくなるまで貪欲選択をループ
    while (amt > 0) {
        // 残り金額に近く、それ以下の最小硬貨を見つける
        while (i > 0 && coins[i] > amt) {
            i--;
        }
        // coins[i] を選択
        amt -= coins[i];
        count++;
    }
    // 実行可能な解が見つからない場合、-1 を返す
    return amt == 0 ? count : -1;
}

/* ドライバーコード */
int main() {
    // 貪欲法：大域最適解の発見を保証できる
    vector<int> coins = {1, 5, 10, 20, 50, 100};
    int amt = 186;
    int res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << amt << " を作るのに必要な最小硬貨数は " << res << " です" << endl;

    // 貪欲法：大域最適解の発見を保証できない
    coins = {1, 20, 50};
    amt = 60;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << amt << " を作るのに必要な最小硬貨数は " << res << " です" << endl;
    cout << "実際には、最小必要数は 3 です。つまり、20 + 20 + 20" << endl;

    // 貪欲法：大域最適解の発見を保証できない
    coins = {1, 49, 50};
    amt = 98;
    res = coinChangeGreedy(coins, amt);
    cout << "\ncoins = ";
    printVector(coins);
    cout << "amt = " << amt << endl;
    cout << amt << " を作るのに必要な最小硬貨数は " << res << " です" << endl;
    cout << "実際には、最小必要数は 2 です。つまり、49 + 49" << endl;

    return 0;
}