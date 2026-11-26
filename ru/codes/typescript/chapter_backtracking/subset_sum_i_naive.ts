/**
 * File: subset_sum_i_naive.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Поиск с возвратом: сумма подмножества I */
function backtrack(
    state: number[],
    target: number,
    total: number,
    choices: number[],
    res: number[][]
): void {
    // Если сумма подмножества равна target, сохраняем решение
    if (total === target) {
        res.push([...state]);
        return;
    }
    // Перебираем все варианты
    for (let i = 0; i < choices.length; i++) {
        // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
        if (total + choices[i] > target) {
            continue;
        }
        // Пробуем вариант и обновляем сумму элементов total
        state.push(choices[i]);
        // Переходим к следующему выбору
        backtrack(state, target, total + choices[i], choices, res);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop();
    }
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
function subsetSumINaive(nums: number[], target: number): number[][] {
    const state = []; // Состояние (подмножество)
    const total = 0; // Сумма подмножества
    const res = []; // Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Основная программа */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`Исходный массив nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Все подмножества с суммой ${target}: res = ${JSON.stringify(res)}`);
console.log('Обратите внимание: результат этого метода содержит повторяющиеся множества');

export {};
