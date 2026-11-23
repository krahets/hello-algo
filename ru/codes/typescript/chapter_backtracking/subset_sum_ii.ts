/**
 * File: subset_sum_ii.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств II */
function backtrack(
    state: number[],
    target: number,
    choices: number[],
    start: number,
    res: number[][]
): void {
    // Если сумма подмножества равна target, записать решение
    if (target === 0) {
        res.push([...state]);
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for (let i = start; i < choices.length; i++) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // Попытка: сделать выбор и обновить target и start
        state.push(choices[i]);
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.pop();
    }
}

/* Решить задачу суммы подмножеств II */
function subsetSumII(nums: number[], target: number): number[][] {
    const state = []; // Состояние (подмножество)
    nums.sort((a, b) => a - b); // Отсортировать nums
    const start = 0; // Стартовая вершина обхода
    const res = []; // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`Входной массив nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Все подмножества с суммой ${target}: res = ${JSON.stringify(res)}`);

export {};
