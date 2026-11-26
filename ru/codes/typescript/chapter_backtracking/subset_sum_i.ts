/**
 * File: subset_sum_i.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Поиск с возвратом: сумма подмножества I */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // Если сумма подмножества равна target, сохраняем решение
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Перебираем все варианты
    // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    for (let i = start; i < choices.length; i++) {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Пробуем вариант и обновляем target и start
        state.push(choices[i]);
        // Переходим к следующему выбору
        backtrack(state, target - choices[i], choices, i, res);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop();
    }
}

/* Задача о сумме подмножества I */
function subsetSumI(nums: number[], target: number): number[][] {
    const state = []; // Состояние (подмножество)
    nums.sort((a, b) => a - b); // Сортируем nums
    const start = 0; // Начальная позиция перебора
    const res = []; // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Основная программа */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumI(nums, target);
console.log(`Исходный массив nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Все подмножества с суммой ${target}: res = ${JSON.stringify(res)}`);

export {};
