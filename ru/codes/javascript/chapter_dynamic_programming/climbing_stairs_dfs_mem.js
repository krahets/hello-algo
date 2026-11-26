/**
 * File: climbing_stairs_dfs_mem.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Поиск с мемоизацией */
function dfs(i, mem) {
    // Для dp[1] и dp[2] вернуть известные значения
    if (i === 1 || i === 2) return i;
    // Если dp[i] уже вычислено, вернуть сохранённое значение
    if (mem[i] != -1) return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Сохранить dp[i]
    mem[i] = count;
    return count;
}

/* Подъём по лестнице: поиск с мемоизацией */
function climbingStairsDFSMem(n) {
    // mem[i] хранит число способов достичь ступени i, а -1 означает отсутствие записи
    const mem = new Array(n + 1).fill(-1);
    return dfs(n, mem);
}

/* Основная программа */
const n = 9;
const res = climbingStairsDFSMem(n);
console.log(`Число способов подняться на лестницу из ${n} ступеней: ${res}.`);
