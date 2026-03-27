/**
 * File: subset_sum_ii.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Алгоритм бэктрекинга: сумма подмножеств II */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Если сумма подмножества равна target, записать решение
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for (int i = start; i < choices.size(); i++) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // Попытка: сделать выбор и обновить target и start
        state.push_back(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop_back();
    }
}

/* Решить задачу суммы подмножеств II */
vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
    vector<int> state;              // Состояние (подмножество)
    sort(nums.begin(), nums.end()); // Отсортировать nums
    int start = 0;                  // Стартовая вершина обхода
    vector<vector<int>> res;        // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumII(nums, target);

    cout << "Входной массив nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Все подмножества с суммой " << target << ": " << endl;
    printVectorMatrix(res);

    return 0;
}
