/**
 * File: permutations_ii.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Поиск с возвратом: перестановки II */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Перебираем все варианты
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if (!selected[i] && !duplicated.has(choice)) {
            // Пробуем вариант и обновляем состояние
            duplicated.add(choice); // Отмечаем уже выбранные значения
            selected[i] = true;
            state.push(choice);
            // Переходим к следующему выбору
            backtrack(state, choices, selected, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = false;
            state.pop();
        }
    });
}

/* Перестановки II */
function permutationsII(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Основная программа
const nums: number[] = [1, 2, 2];
const res: number[][] = permutationsII(nums);

console.log(`Исходный массив nums = ${JSON.stringify(nums)}`);
console.log(`Все перестановки res = ${JSON.stringify(res)}`);

export {};
