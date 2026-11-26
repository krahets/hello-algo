#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

/* Рюкзак 0–1: полный перебор */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Вернуть большую из двух стоимостей
    return max(no, yes);
}

/* Рюкзак 0–1: поиск с мемоизацией */
int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Если результат сохранён, сразу вернуть его
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Сохранить и вернуть большую из двух стоимостей
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* Рюкзак 0–1: динамическое программирование */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Рюкзак 0–1: динамическое программирование с экономией памяти */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Инициализировать таблицу dp
    vector<int> dp(cap + 1, 0);
    // Переход между состояниями
    for (int i = 1; i <= n; i++) {
        // Обход в обратном порядке
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Основная программа */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // Полный перебор
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "Максимальная стоимость предметов, помещающихся в рюкзак: " << res << endl;

    // Поиск с мемоизацией
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "Максимальная стоимость предметов, помещающихся в рюкзак: " << res << endl;

    // Динамическое программирование
    res = knapsackDP(wgt, val, cap);
    cout << "Максимальная стоимость предметов, помещающихся в рюкзак: " << res << endl;

    // Динамическое программирование с экономией памяти
    res = knapsackDPComp(wgt, val, cap);
    cout << "Максимальная стоимость предметов, помещающихся в рюкзак: " << res << endl;

    return 0;
}
