/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Алгоритм бэктрекинга: сумма подмножеств I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Если сумма подмножества равна target, записать решение
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    for (int i = start; i < choices.size(); i++) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Попытка: сделать выбор и обновить target и start
        state.push_back(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop_back();
    }
}

/* Решить задачу суммы подмножеств I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // Состояние (подмножество)
    sort(nums.begin(), nums.end()); // Отсортировать nums
    int start = 0;                  // Стартовая вершина обхода
    vector<vector<int>> res;        // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "Входной массив nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Все подмножества с суммой " << target << ": " << endl;
    printVectorMatrix(res);

    return 0;
}
