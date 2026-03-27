/**
 * File: climbing_stairs_backtrack.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Бэктрекинг */
function backtrack(
    choices: number[],
    state: number,
    n: number,
    res: Map<0, any>
): void {
    // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
    if (state === n) res.set(0, res.get(0) + 1);
    // Перебор всех вариантов выбора
    for (const choice of choices) {
        // Отсечение: нельзя выходить за n-ю ступень
        if (state + choice > n) continue;
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Откат
    }
}

/* Подъем по лестнице: бэктрекинг */
function climbingStairsBacktrack(n: number): number {
    const choices = [1, 2]; // Можно подняться на 1 или 2 ступени
    const state = 0; // Начать подъем с 0-й ступени
    const res = new Map();
    res.set(0, 0); // Использовать res[0] для хранения числа решений
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Driver Code */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`Количество способов подняться по лестнице из ${n} ступеней = ${res} вариантов`);

export {};
