
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск с возвратом */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // На ступени n увеличить число способов на 1
    if (state == n)
        res[0]++;
    // Перебрать все варианты
    for (auto &choice : choices) {
        // Отсечь шаги за ступень n
        if (state + choice > n)
            continue;
        // Сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Отменить выбор
    }
}

/* Подъём по лестнице: поиск с возвратом */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // Можно подняться на 1 или 2 ступени
    int state = 0;                // Начать со ступени 0
    vector<int> res = {0};        // Хранить число способов в res[0]
    backtrack(choices, state, n, res);
    return res[0];
}

/* Основная программа */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "Для ступени " << n << " результат равен " << res << " (число способов подъёма)." << endl;

    return 0;
}
