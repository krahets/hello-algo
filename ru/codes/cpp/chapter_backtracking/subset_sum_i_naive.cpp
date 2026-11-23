/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Алгоритм бэктрекинга: сумма подмножеств I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // Если сумма подмножества равна target, записать решение
    if (total == target) {
        res.push_back(state);
        return;
    }
    // Перебор всех вариантов выбора
    for (size_t i = 0; i < choices.size(); i++) {
        // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if (total + choices[i] > target) {
            continue;
        }
        // Попытка: сделать выбор и обновить элемент и total
        state.push_back(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target, total + choices[i], choices, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop_back();
    }
}

/* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // Состояние (подмножество)
    int total = 0;           // Сумма подмножеств
    vector<vector<int>> res; // Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "Входной массив nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Все подмножества с суммой " << target << ": " << endl;
    printVectorMatrix(res);

    return 0;
}
