/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Размен монет II: динамическое программирование */
int coinChangeIIDP(vector<int> &coins, int amt) {
    int n = coins.size();
    // Инициализация таблицы dp
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // Инициализация первого столбца
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
int coinChangeIIDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    // Инициализация таблицы dp
    vector<int> dp(amt + 1, 0);
    dp[0] = 1;
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver code */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 5;

    // Динамическое программирование
    int res = coinChangeIIDP(coins, amt);
    cout << "Количество комбинаций монет для набора целевой суммы = " << res << endl;

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeIIDPComp(coins, amt);
    cout << "Количество комбинаций монет для набора целевой суммы = " << res << endl;

    return 0;
}
