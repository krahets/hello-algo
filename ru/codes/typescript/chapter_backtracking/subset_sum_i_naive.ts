/**
 * File: subset_sum_i_naive.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножества I */
function backtrack(
    state: number[],
    target: number,
    total: number,
    choices: number[],
    res: number[][]
): void {
    // Если сумма подмножества равна target, записать решение
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Перебрать все варианты выбора
    for (let i = 0; i < choices.length; i++) {
        // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if (total + choices[i] > target) {
            continue;
        }
        // Попытка: сделать выбор и обновить сумму элементов total
        state.push(choices[i]);
        // Перейти к следующему варианту выбора
        backtrack(state, target, total + choices[i], choices, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop();
    }
}

/* Решить задачу суммы подмножества I (включая повторяющиеся подмножества) */
function subsetSumINaive(nums: number[], target: number): number[][] {
    const state = []; // Состояние (подмножество)
    const total = 0; // подмножествосумма
    const res = []; // Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`Входной массив nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Все подмножества с суммой ${target} res = ${JSON.stringify(res)}`);
console.log('Обратите внимание: результат этого метода содержит повторяющиеся множества');

export {};
