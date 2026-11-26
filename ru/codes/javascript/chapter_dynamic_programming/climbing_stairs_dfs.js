/**
 * File: climbing_stairs_dfs.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Поиск */
function dfs(i) {
    // Для dp[1] и dp[2] вернуть известные значения
    if (i === 1 || i === 2) return i;
    // dp[i] = dp[i-1] + dp[i-2]
    const count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Подъём по лестнице: поиск */
function climbingStairsDFS(n) {
    return dfs(n);
}

/* Основная программа */
const n = 9;
const res = climbingStairsDFS(n);
console.log(`Число способов подняться на лестницу из ${n} ступеней: ${res}.`);
