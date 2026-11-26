/**
 * File: unbounded_knapsack.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Неограниченный рюкзак: динамическое программирование */
int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Инициализировать таблицу dp
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // Переход между состояниями
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Неограниченный рюкзак: динамическое программирование с экономией памяти */
int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Инициализировать таблицу dp
    vector<int> dp(cap + 1, 0);
    // Переход между состояниями
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[c] = dp[c];
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Основная программа */
int main() {
    vector<int> wgt = {1, 2, 3};
    vector<int> val = {5, 11, 15};
    int cap = 4;

    // Динамическое программирование
    int res = unboundedKnapsackDP(wgt, val, cap);
    cout << "Максимальная стоимость предметов, помещающихся в рюкзак: " << res << endl;

    // Динамическое программирование с экономией памяти
    res = unboundedKnapsackDPComp(wgt, val, cap);
    cout << "Максимальная стоимость предметов, помещающихся в рюкзак: " << res << endl;

    return 0;
}
