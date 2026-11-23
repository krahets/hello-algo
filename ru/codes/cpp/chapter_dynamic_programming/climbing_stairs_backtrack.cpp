
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Бэктрекинг */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
    if (state == n)
        res[0]++;
    // Перебор всех вариантов выбора
    for (auto &choice : choices) {
        // Отсечение: нельзя выходить за n-ю ступень
        if (state + choice > n)
            continue;
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Откат
    }
}

/* Подъем по лестнице: бэктрекинг */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // Можно подняться на 1 или 2 ступени
    int state = 0;                // Начать подъем с 0-й ступени
    vector<int> res = {0};        // Использовать res[0] для хранения числа решений
    backtrack(choices, state, n, res);
    return res[0];
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "Количество способов подняться по лестнице из " << n << " ступеней: " << res << " вариантов" << endl;

    return 0;
}
