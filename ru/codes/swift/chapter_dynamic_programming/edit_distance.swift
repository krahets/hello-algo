/**
 * File: edit_distance.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Редакционное расстояние: полный перебор */
func editDistanceDFS(s: String, t: String, i: Int, j: Int) -> Int {
    // Если строки s и t обе пусты, вернуть 0
    if i == 0, j == 0 {
        return 0
    }
    // Если строка s пуста, вернуть длину t
    if i == 0 {
        return j
    }
    // Если строка t пуста, вернуть длину s
    if j == 0 {
        return i
    }
    // Если два символа равны, просто пропустить их
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // Минимальное число правок = минимум из вставки, удаления и замены + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Вернуть минимальное число операций редактирования
    return min(min(insert, delete), replace) + 1
}

/* Редакционное расстояние: поиск с мемоизацией */
func editDistanceDFSMem(s: String, t: String, mem: inout [[Int]], i: Int, j: Int) -> Int {
    // Если строки s и t обе пусты, вернуть 0
    if i == 0, j == 0 {
        return 0
    }
    // Если строка s пуста, вернуть длину t
    if i == 0 {
        return j
    }
    // Если строка t пуста, вернуть длину s
    if j == 0 {
        return i
    }
    // Если запись уже существует, сразу вернуть ее
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // Если два символа равны, просто пропустить их
    if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
        return editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    }
    // Минимальное число правок = минимум из вставки, удаления и замены + 1
    let insert = editDistanceDFS(s: s, t: t, i: i, j: j - 1)
    let delete = editDistanceDFS(s: s, t: t, i: i - 1, j: j)
    let replace = editDistanceDFS(s: s, t: t, i: i - 1, j: j - 1)
    // Сохранить и вернуть минимальное число операций редактирования
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* Редакционное расстояние: динамическое программирование */
func editDistanceDP(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    // Переход состояния: первая строка и первый столбец
    for i in 1 ... n {
        dp[i][0] = i
    }
    for j in 1 ... m {
        dp[0][j] = j
    }
    // Переход состояния: остальные строки и столбцы
    for i in 1 ... n {
        for j in 1 ... m {
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // Если два символа равны, просто пропустить их
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // Минимальное число правок = минимум из вставки, удаления и замены + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
func editDistanceDPComp(s: String, t: String) -> Int {
    let n = s.utf8CString.count
    let m = t.utf8CString.count
    var dp = Array(repeating: 0, count: m + 1)
    // Переход состояния: первая строка
    for j in 1 ... m {
        dp[j] = j
    }
    // Переход состояния: остальные строки
    for i in 1 ... n {
        // Переход состояния: первый столбец
        var leftup = dp[0] // Временно сохранить dp[i-1, j-1]
        dp[0] = i
        // Переход состояния: остальные столбцы
        for j in 1 ... m {
            let temp = dp[j]
            if s.utf8CString[i - 1] == t.utf8CString[j - 1] {
                // Если два символа равны, просто пропустить их
                dp[j] = leftup
            } else {
                // Минимальное число правок = минимум из вставки, удаления и замены + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // Обновить до значения dp[i-1, j-1] для следующей итерации
        }
    }
    return dp[m]
}

@main
enum EditDistance {
    /* Driver Code */
    static func main() {
        let s = "bag"
        let t = "pack"
        let n = s.utf8CString.count
        let m = t.utf8CString.count

        // Полный перебор
        var res = editDistanceDFS(s: s, t: t, i: n, j: m)
        print("Чтобы изменить \(s) на \(t), требуется минимум \(res) шагов редактирования")

        // Поиск с мемоизацией
        var mem = Array(repeating: Array(repeating: -1, count: m + 1), count: n + 1)
        res = editDistanceDFSMem(s: s, t: t, mem: &mem, i: n, j: m)
        print("Чтобы изменить \(s) на \(t), требуется минимум \(res) шагов редактирования")

        // Динамическое программирование
        res = editDistanceDP(s: s, t: t)
        print("Чтобы изменить \(s) на \(t), требуется минимум \(res) шагов редактирования")

        // Динамическое программирование с оптимизацией по памяти
        res = editDistanceDPComp(s: s, t: t)
        print("Чтобы изменить \(s) на \(t), требуется минимум \(res) шагов редактирования")
    }
}
