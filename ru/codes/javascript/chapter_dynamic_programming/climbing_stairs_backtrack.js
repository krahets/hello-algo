/**
 * File: climbing_stairs_backtrack.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Поиск с возвратом */
function backtrack(choices, state, n, res) {
    // На ступени n увеличить число способов на 1
    if (state === n) res.set(0, res.get(0) + 1);
    // Перебрать все варианты
    for (const choice of choices) {
        // Отсечь шаги за ступень n
        if (state + choice > n) continue;
        // Сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Отменить выбор
    }
}

/* Подъём по лестнице: поиск с возвратом */
function climbingStairsBacktrack(n) {
    const choices = [1, 2]; // Можно подняться на 1 или 2 ступени
    const state = 0; // Начать со ступени 0
    const res = new Map();
    res.set(0, 0); // Хранить число способов в res[0]
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Основная программа */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`Число способов подняться на лестницу из ${n} ступеней: ${res}.`);
