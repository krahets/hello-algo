/**
 * File: unbounded_knapsack.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Полный рюкзак: динамическое программирование */
int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Инициализация таблицы dp
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Полный рюкзак: динамическое программирование с оптимизацией памяти */
int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Инициализация таблицы dp
    vector<int> dp(cap + 1, 0);
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[c] = dp[c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver code */
int main() {
    vector<int> wgt = {1, 2, 3};
    vector<int> val = {5, 11, 15};
    int cap = 4;

    // Динамическое программирование
    int res = unboundedKnapsackDP(wgt, val, cap);
    cout << "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна " << res << endl;

    // Динамическое программирование с оптимизацией памяти
    res = unboundedKnapsackDPComp(wgt, val, cap);
    cout << "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна " << res << endl;

    return 0;
}
