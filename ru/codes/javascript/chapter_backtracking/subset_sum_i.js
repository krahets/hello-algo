/**
 * File: subset_sum_i.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств I */
function backtrack(state, target, choices, start, res) {
    // Если сумма подмножества равна target, записать решение
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    for (let i = start; i < choices.length; i++) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Попытка: сделать выбор и обновить target и start
        state.push(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop();
    }
}

/* Решить задачу суммы подмножеств I */
function subsetSumI(nums, target) {
    const state = []; // Состояние (подмножество)
    nums.sort((a, b) => a - b); // Отсортировать nums
    const start = 0; // Стартовая вершина обхода
    const res = []; // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumI(nums, target);
console.log(`Входной массив nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Все подмножества с суммой ${target}: res = ${JSON.stringify(res)}`);
