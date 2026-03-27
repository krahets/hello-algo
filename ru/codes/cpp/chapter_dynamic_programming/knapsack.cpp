#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

/* Рюкзак 0-1: полный перебор */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Вернуть вариант с большей стоимостью из двух возможных
    return max(no, yes);
}

/* Рюкзак 0-1: поиск с мемоизацией */
int knapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<vector<int>> &mem, int i, int c) {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // Если запись уже есть, вернуть сразу
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Сохранить и вернуть вариант с большей стоимостью из двух решений
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* Рюкзак 0-1: динамическое программирование */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Инициализация таблицы dp
    vector<int> dp(cap + 1, 0);
    // Переход состояний
    for (int i = 1; i <= n; i++) {
        // Обход в обратном порядке
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // Полный перебор
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна " << res << endl;

    // Поиск с мемоизацией
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна " << res << endl;

    // Динамическое программирование
    res = knapsackDP(wgt, val, cap);
    cout << "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна " << res << endl;

    // Динамическое программирование с оптимизацией памяти
    res = knapsackDPComp(wgt, val, cap);
    cout << "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна " << res << endl;

    return 0;
}
