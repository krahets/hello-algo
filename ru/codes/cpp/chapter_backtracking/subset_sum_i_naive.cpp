/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск с возвратом: сумма подмножества I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // Если сумма подмножества равна target, сохраняем решение
    if (total == target) {
        res.push_back(state);
        return;
    }
    // Перебираем все варианты
    for (size_t i = 0; i < choices.size(); i++) {
        // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
        if (total + choices[i] > target) {
            continue;
        }
        // Пробуем вариант и обновляем сумму элементов total
        state.push_back(choices[i]);
        // Переходим к следующему выбору
        backtrack(state, target, total + choices[i], choices, res);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop_back();
    }
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // Состояние (подмножество)
    int total = 0;           // Сумма подмножества
    vector<vector<int>> res; // Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Основная программа */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "Исходный массив nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Все подмножества с суммой " << target << " образуют список res = " << endl;
    printVectorMatrix(res);

    return 0;
}
