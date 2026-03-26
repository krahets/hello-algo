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
    // Переход состояния: первая строка и первый столбец
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // Переход состояния: остальные строки и столбцы
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Выбрать меньшее из двух вариантов: не брать или взять монету i
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
    // Инициализировать таблицу dp
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // Переход состояния
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[a] = dp[a];
            } else {
                // Выбрать меньшее из двух вариантов: не брать или взять монету i
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
    cout << "Минимальное число монет, необходимое для получения целевой суммы, равно " << res << endl;

    // Динамическое программирование с оптимизацией по памяти
    res = coinChangeDPComp(coins, amt);
    cout << "Минимальное число монет, необходимое для получения целевой суммы, равно " << res << endl;

    return 0;
}
