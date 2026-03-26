/**
 * File: edit_distance.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Редакционное расстояние: полный перебор */
function editDistanceDFS(s, t, i, j) {
    // Если строки s и t обе пусты, вернуть 0
    if (i === 0 && j === 0) return 0;

    // Если строка s пуста, вернуть длину t
    if (i === 0) return j;

    // Если строка t пуста, вернуть длину s
    if (j === 0) return i;

    // Если два символа равны, просто пропустить их
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // Минимальное число правок = минимум из вставки, удаления и замены + 1
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Вернуть минимальное число операций редактирования
    return Math.min(insert, del, replace) + 1;
}

/* Редакционное расстояние: поиск с мемоизацией */
function editDistanceDFSMem(s, t, mem, i, j) {
    // Если строки s и t обе пусты, вернуть 0
    if (i === 0 && j === 0) return 0;

    // Если строка s пуста, вернуть длину t
    if (i === 0) return j;

    // Если строка t пуста, вернуть длину s
    if (j === 0) return i;

    // Если запись уже существует, сразу вернуть ее
    if (mem[i][j] !== -1) return mem[i][j];

    // Если два символа равны, просто пропустить их
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // Минимальное число правок = минимум из вставки, удаления и замены + 1
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Сохранить и вернуть минимальное число операций редактирования
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* Редакционное расстояние: динамическое программирование */
function editDistanceDP(s, t) {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
    // Переход состояния: первая строка и первый столбец
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // Переход состояния: остальные строки и столбцы
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Если два символа равны, просто пропустить их
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Минимальное число правок = минимум из вставки, удаления и замены + 1
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
function editDistanceDPComp(s, t) {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // Переход состояния: первая строка
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // Переход состояния: остальные строки
    for (let i = 1; i <= n; i++) {
        // Переход состояния: первый столбец
        let leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
        dp[0] = i;
        // Переход состояния: остальные столбцы
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Если два символа равны, просто пропустить их
                dp[j] = leftup;
            } else {
                // Минимальное число правок = минимум из вставки, удаления и замены + 1
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // Обновить до значения dp[i-1, j-1] для следующей итерации
        }
    }
    return dp[m];
}

const s = 'bag';
const t = 'pack';
const n = s.length,
    m = t.length;

// Полный перебор
let res = editDistanceDFS(s, t, n, m);
console.log(`Чтобы изменить ${s} на ${t}, требуется минимум ${res} шагов редактирования`);

// Поиск с мемоизацией
const mem = Array.from(new Array(n + 1), () => new Array(m + 1).fill(-1));
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`Чтобы изменить ${s} на ${t}, требуется минимум ${res} шагов редактирования`);

// Динамическое программирование
res = editDistanceDP(s, t);
console.log(`Чтобы изменить ${s} на ${t}, требуется минимум ${res} шагов редактирования`);

// Динамическое программирование с оптимизацией по памяти
res = editDistanceDPComp(s, t);
console.log(`Чтобы изменить ${s} на ${t}, требуется минимум ${res} шагов редактирования`);
