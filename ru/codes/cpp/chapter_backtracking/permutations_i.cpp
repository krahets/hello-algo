/**
 * File: permutations_i.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Алгоритм бэктрекинга: все перестановки I */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // Когда длина состояния равна числу элементов, записать решение
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // Перебор всех вариантов выбора
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // Отсечение: нельзя выбирать один и тот же элемент повторно
        if (!selected[i]) {
            // Попытка: сделать выбор и обновить состояние
            selected[i] = true;
            state.push_back(choice);
            // Перейти к следующему выбору
            backtrack(state, choices, selected, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* Все перестановки I */
vector<vector<int>> permutationsI(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 2, 3};

    vector<vector<int>> res = permutationsI(nums);

    cout << "Входной массив nums = ";
    printVector(nums);
    cout << "Все перестановки res = ";
    printVectorMatrix(res);

    return 0;
}
