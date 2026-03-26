/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Алгоритм бэктрекинга: сумма подмножества I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Если сумма подмножества равна target, записать решение
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации дублирующихся подмножеств
    for (int i = start; i < choices.size(); i++) {
        // Отсечение 1: если сумма подмножества превышает target, сразу завершить цикл
        // Это связано с тем, что массив уже отсортирован, последующие элементы больше, поэтому сумма подмножества обязательно превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Попытка: сделать выбор и обновить target, start
        state.push_back(choices[i]);
        // Перейти к следующему варианту выбора
        backtrack(state, target - choices[i], choices, i, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop_back();
    }
}

/* Решить задачу суммы подмножества I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // Состояние (подмножество)
    sort(nums.begin(), nums.end()); // Отсортировать nums
    int start = 0;                  // Обход начальной вершины
    vector<vector<int>> res;        // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "Входмассив nums =";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Все подмножества res с суммой " << target << " = " << endl;
    printVectorMatrix(res);

    return 0;
}
