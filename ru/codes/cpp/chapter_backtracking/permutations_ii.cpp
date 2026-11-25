/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск с возвратом: перестановки II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // Перебираем все варианты
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // Пробуем вариант и обновляем состояние
            duplicated.emplace(choice); // Отмечаем уже выбранные значения
            selected[i] = true;
            state.push_back(choice);
            // Переходим к следующему выбору
            backtrack(state, choices, selected, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* Перестановки II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Основная программа */
int main() {
    vector<int> nums = {1, 1, 2};

    vector<vector<int>> res = permutationsII(nums);

    cout << "Исходный массив nums = ";
    printVector(nums);
    cout << "Все перестановки res = ";
    printVectorMatrix(res);

    return 0;
}
