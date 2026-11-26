/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск с возвратом: сумма подмножества I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Если сумма подмножества равна target, сохраняем решение
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Перебираем все варианты
    // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    for (int i = start; i < choices.size(); i++) {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Пробуем вариант и обновляем target и start
        state.push_back(choices[i]);
        // Переходим к следующему выбору
        backtrack(state, target - choices[i], choices, i, res);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop_back();
    }
}

/* Задача о сумме подмножества I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // Состояние (подмножество)
    sort(nums.begin(), nums.end()); // Сортируем nums
    int start = 0;                  // Начальная позиция перебора
    vector<vector<int>> res;        // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Основная программа */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "Исходный массив nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Все подмножества с суммой " << target << " образуют список res = " << endl;
    printVectorMatrix(res);

    return 0;
}
