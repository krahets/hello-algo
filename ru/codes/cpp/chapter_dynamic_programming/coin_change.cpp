/**
 * File: coin_change.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Размен монет: динамическое программирование */
int coinChangeDP(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // Инициализация таблицы dp
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // Переход состояний: первая строка и первый столбец
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Переход состояний: остальные строки и столбцы
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* Размен монет: динамическое программирование с оптимизацией памяти */
int coinChangeDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // Инициализация таблицы dp
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1;
}

/* Driver code */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 4;

    // Динамическое программирование
    int res = coinChangeDP(coins, amt);
    cout << "Минимальное количество монет для целевой суммы = " << res << endl;

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeDPComp(coins, amt);
    cout << "Минимальное количество монет для целевой суммы = " << res << endl;

    return 0;
}
