/**
 * File: edit_distance.cpp
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Редакционное расстояние: полный перебор */
int editDistanceDFS(string s, string t, int i, int j) {
    // Если s и t пусты, вернуть 0
    if (i == 0 && j == 0)
        return 0;
    // Если s пуста, вернуть длину t
    if (i == 0)
        return j;
    // Если t пуста, вернуть длину s
    if (j == 0)
        return i;
    // Если символы совпадают, пропустить оба
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Вернуть минимальное число правок
    return min(min(insert, del), replace) + 1;
}

/* Редакционное расстояние: поиск с мемоизацией */
int editDistanceDFSMem(string s, string t, vector<vector<int>> &mem, int i, int j) {
    // Если s и t пусты, вернуть 0
    if (i == 0 && j == 0)
        return 0;
    // Если s пуста, вернуть длину t
    if (i == 0)
        return j;
    // Если t пуста, вернуть длину s
    if (j == 0)
        return i;
    // Если результат сохранён, сразу вернуть его
    if (mem[i][j] != -1)
        return mem[i][j];
    // Если символы совпадают, пропустить оба
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
    int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Сохранить и вернуть минимальное число правок
    mem[i][j] = min(min(insert, del), replace) + 1;
    return mem[i][j];
}

/* Редакционное расстояние: динамическое программирование */
int editDistanceDP(string s, string t) {
    int n = s.length(), m = t.length();
    vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
    // Переход: первая строка и первый столбец
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // Переход: остальные строки и столбцы
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // Если символы совпадают, пропустить оба
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* Редакционное расстояние: динамическое программирование с экономией памяти */
int editDistanceDPComp(string s, string t) {
    int n = s.length(), m = t.length();
    vector<int> dp(m + 1, 0);
    // Переход: первая строка
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // Переход: остальные строки
    for (int i = 1; i <= n; i++) {
        // Переход: первый столбец
        int leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
        dp[0] = i;
        // Переход: остальные столбцы
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // Если символы совпадают, пропустить оба
                dp[j] = leftup;
            } else {
                // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Обновить значение dp[i-1, j-1] для следующей итерации
        }
    }
    return dp[m];
}

/* Основная программа */
int main() {
    string s = "bag";
    string t = "pack";
    int n = s.length(), m = t.length();

    // Полный перебор
    int res = editDistanceDFS(s, t, n, m);
    cout << "Для преобразования " << s << " в " << t << " результат равен " << res << " (минимальное число правок).\n";

    // Поиск с мемоизацией
    vector<vector<int>> mem(n + 1, vector<int>(m + 1, -1));
    res = editDistanceDFSMem(s, t, mem, n, m);
    cout << "Для преобразования " << s << " в " << t << " результат равен " << res << " (минимальное число правок).\n";

    // Динамическое программирование
    res = editDistanceDP(s, t);
    cout << "Для преобразования " << s << " в " << t << " результат равен " << res << " (минимальное число правок).\n";

    // Динамическое программирование с экономией памяти
    res = editDistanceDPComp(s, t);
    cout << "Для преобразования " << s << " в " << t << " результат равен " << res << " (минимальное число правок).\n";

    return 0;
}
