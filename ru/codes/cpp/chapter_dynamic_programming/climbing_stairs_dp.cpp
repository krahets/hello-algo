/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Подъем по лестнице: динамическое программирование */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // Инициализация таблицы dp для хранения решений подзадач
    vector<int> dp(n + 1);
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
int climbingStairsDPComp(int n) {
    if (n == 1 || n == 2)
        return n;
    int a = 1, b = 2;
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    cout << "Количество способов подняться по лестнице из " << n << " ступеней: " << res << " вариантов" << endl;

    res = climbingStairsDPComp(n);
    cout << "Количество способов подняться по лестнице из " << n << " ступеней: " << res << " вариантов" << endl;

    return 0;
}
