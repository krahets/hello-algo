/**
 * File: permutations_ii.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Алгоритм бэктрекинга: все перестановки II */
function backtrack(state, choices, selected, res) {
    // Когда длина состояния равна числу элементов, записать решение
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // Перебрать все варианты выбора
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // Отсечение: не допускается повторный выбор элемента и не допускается повторный выбор равных элементов
        if (!selected[i] && !duplicated.has(choice)) {
            // Попытка: сделать выбор и обновить состояние
            duplicated.add(choice); // Записатьвыбранныеэлементзначение
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

/* Все перестановки II */
function permutationsII(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// Driver Code
const nums = [1, 2, 2];
const res = permutationsII(nums);

console.log(`Входной массив nums = ${JSON.stringify(nums)}`);
console.log(`Все перестановки res = ${JSON.stringify(res)}`);
