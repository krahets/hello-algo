/**
 * File: subset_sum_ii.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Поиск с возвратом: сумма подмножества II */
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
    // Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
    for (let i = start; i < choices.length; i++) {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
        if (i > start && choices[i] === choices[i - 1]) {
            continue;
        }
        // Пробуем вариант и обновляем target и start
        state.push(choices[i]);
        // Переходим к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.pop();
    }
}

/* Задача о сумме подмножества II */
function subsetSumII(nums: number[], target: number): number[][] {
    const state = []; // Состояние (подмножество)
    nums.sort((a, b) => a - b); // Сортируем nums
    const start = 0; // Начальная позиция перебора
    const res = []; // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Основная программа */
const nums = [4, 4, 5];
const target = 9;
const res = subsetSumII(nums, target);
console.log(`Исходный массив nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`Все подмножества с суммой ${target}: res = ${JSON.stringify(res)}`);

export {};
