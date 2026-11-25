/**
 * File: edit_distance.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Редакционное расстояние: полный перебор */
function editDistanceDFS(s, t, i, j) {
    // Если s и t пусты, вернуть 0
    if (i === 0 && j === 0) return 0;

    // Если s пуста, вернуть длину t
    if (i === 0) return j;

    // Если t пуста, вернуть длину s
    if (j === 0) return i;

    // Если символы совпадают, пропустить оба
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Вернуть минимальное число правок
    return Math.min(insert, del, replace) + 1;
}

/* Редакционное расстояние: поиск с мемоизацией */
function editDistanceDFSMem(s, t, mem, i, j) {
    // Если s и t пусты, вернуть 0
    if (i === 0 && j === 0) return 0;

    // Если s пуста, вернуть длину t
    if (i === 0) return j;

    // Если t пуста, вернуть длину s
    if (j === 0) return i;

    // Если результат сохранён, сразу вернуть его
    if (mem[i][j] !== -1) return mem[i][j];

    // Если символы совпадают, пропустить оба
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Сохранить и вернуть минимальное число правок
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* Редакционное расстояние: динамическое программирование */
function editDistanceDP(s, t) {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
    // Переход: первая строка и первый столбец
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // Переход: остальные строки и столбцы
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Если символы совпадают, пропустить оба
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* Редакционное расстояние: динамическое программирование с экономией памяти */
function editDistanceDPComp(s, t) {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // Переход: первая строка
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // Переход: остальные строки
    for (let i = 1; i <= n; i++) {
        // Переход: первый столбец
        let leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
        dp[0] = i;
        // Переход: остальные столбцы
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Если символы совпадают, пропустить оба
                dp[j] = leftup;
            } else {
                // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // Обновить значение dp[i-1, j-1] для следующей итерации
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
console.log(`Для преобразования ${s} в ${t} требуется минимум правок: ${res}.`);

// Поиск с мемоизацией
const mem = Array.from(new Array(n + 1), () => new Array(m + 1).fill(-1));
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`Для преобразования ${s} в ${t} требуется минимум правок: ${res}.`);

// Динамическое программирование
res = editDistanceDP(s, t);
console.log(`Для преобразования ${s} в ${t} требуется минимум правок: ${res}.`);

// Динамическое программирование с экономией памяти
res = editDistanceDPComp(s, t);
console.log(`Для преобразования ${s} в ${t} требуется минимум правок: ${res}.`);
