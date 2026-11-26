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
    // Инициализировать таблицу dp
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // Переход: первая строка и первый столбец
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Переход: остальные строки и столбцы
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* Размен монет: динамическое программирование с экономией памяти */
int coinChangeDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // Инициализировать таблицу dp
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // Переход между состояниями
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если номинал превышает нужную сумму, не брать монету i
                dp[a] = dp[a];
            } else {
                // Взять минимум из двух вариантов: без монеты i и с ней
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1;
}

/* Основная программа */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 4;

    // Динамическое программирование
    int res = coinChangeDP(coins, amt);
    cout << "Минимальное число монет для заданной суммы: " << res << endl;

    // Динамическое программирование с экономией памяти
    res = coinChangeDPComp(coins, amt);
    cout << "Минимальное число монет для заданной суммы: " << res << endl;

    return 0;
}
