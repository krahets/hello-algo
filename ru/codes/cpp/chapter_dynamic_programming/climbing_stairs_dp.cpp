/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Подъём по лестнице: динамическое программирование */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // Создать таблицу dp для решений подзадач
    vector<int> dp(n + 1);
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход: решать подзадачи от меньших к большим
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Подъём по лестнице: динамическое программирование с экономией памяти */
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

/* Основная программа */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    cout << "Для ступени " << n << " результат равен " << res << " (число способов подъёма)." << endl;

    res = climbingStairsDPComp(n);
    cout << "Для ступени " << n << " результат равен " << res << " (число способов подъёма)." << endl;

    return 0;
}
