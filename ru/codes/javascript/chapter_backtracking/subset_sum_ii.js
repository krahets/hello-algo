/**
 * File: subset_sum_ii.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножества II */
function backtrack(state, target, choices, start, res) {
    // Если сумма подмножества равна target, записать решение
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации дублирующихся подмножеств
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for (let i = start; i < choices.length; i++) {
        // Отсечение 1: если сумма подмножества превышает target, сразу завершить цикл
        // Это связано с тем, что массив уже отсортирован, последующие элементы больше, поэтому сумма подмножества обязательно превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит данная ветвь поиска дублируется, ее нужно сразу пропустить
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // Попытка: сделать выбор и обновить target, start
        state.push(choices[i]);
        // Перейти к следующему варианту выбора
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop();
    }
}

/* Решить задачу суммы подмножества II */
function subsetSumII(nums, target) {
    const state = []; // Состояние (подмножество)
    nums.sort((a, b) => a - b); // Отсортировать nums
    const start = 0; // Обход начальной вершины
    const res = []; // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`Входной массив nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Все подмножества с суммой ${target} res = ${JSON.stringify(res)}`);
