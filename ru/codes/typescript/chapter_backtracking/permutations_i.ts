/**
 * File: permutations_i.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Поиск с возвратом: перестановки I */
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
    choices.forEach((choice, i) => {
        // Отсечение: нельзя выбирать один элемент дважды
        if (!selected[i]) {
            // Пробуем вариант и обновляем состояние
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

/* Перестановки I */
function permutationsI(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Основная программа
const nums: number[] = [1, 2, 3];
const res: number[][] = permutationsI(nums);

console.log(`Исходный массив nums = ${JSON.stringify(nums)}`);
console.log(`Все перестановки res = ${JSON.stringify(res)}`);

export {};
