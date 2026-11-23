/**
 * File: permutations_i.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Алгоритм бэктрекинга: все перестановки I */
function backtrack(
    state: number[],
    choices: number[],
    selected: boolean[],
    res: number[][]
): void {
    // Когда длина состояния равна числу элементов, записать решение
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Перебор всех вариантов выбора
    choices.forEach((choice, i) => {
        // Отсечение: нельзя выбирать один и тот же элемент повторно
        if (!selected[i]) {
            // Попытка: сделать выбор и обновить состояние
            selected[i] = true;
            state.push(choice);
            // Перейти к следующему выбору
            backtrack(state, choices, selected, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = false;
            state.pop();
        }
    });
}

/* Все перестановки I */
function permutationsI(nums: number[]): number[][] {
    const res: number[][] = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums: number[] = [1, 2, 3];
const res: number[][] = permutationsI(nums);

console.log(`Входной массив nums = ${JSON.stringify(nums)}`);
console.log(`Все перестановки res = ${JSON.stringify(res)}`);

export {};
