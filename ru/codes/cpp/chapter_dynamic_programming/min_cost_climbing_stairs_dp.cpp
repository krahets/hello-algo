/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Минимальная стоимость подъёма: динамическое программирование */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // Создать таблицу dp для решений подзадач
    vector<int> dp(n + 1);
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Переход: решать подзадачи от меньших к большим
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* Минимальная стоимость подъёма: динамическое программирование с экономией памяти */
int minCostClimbingStairsDPComp(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Основная программа */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "Стоимость ступеней: ";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "Минимальная стоимость подъёма: " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "Минимальная стоимость подъёма: " << res << endl;

    return 0;
}
