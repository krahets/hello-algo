/**
 * File: permutations_i.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Алгоритм бэктрекинга: все перестановки I */
function backtrack(state, choices, selected, res) {
    // Когда длина состояния равна числу элементов, записать решение
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Перебрать все варианты выбора
    choices.forEach((choice, i) => {
        // Отсечение: не допускается повторный выбор элемента
        if (!selected[i]) {
            // Попытка: сделать выбор и обновить состояние
            selected[i] = true;
            state.push(choice);
            // Перейти к следующему варианту выбора
            backtrack(state, choices, selected, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = false;
            state.pop();
        }
    });
}

/* Все перестановки I */
function permutationsI(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums = [1, 2, 3];
const res = permutationsI(nums);

console.log(`Входмассив nums = ${JSON.stringify(nums)}`);
console.log(`Все перестановки res = ${JSON.stringify(res)}`);
