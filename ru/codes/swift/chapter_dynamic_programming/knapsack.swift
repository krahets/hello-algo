/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Рюкзак 0-1: полный перебор */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0
    }
    // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Вернуть вариант с большей стоимостью из двух возможных
    return max(no, yes)
}

/* Рюкзак 0-1: поиск с мемоизацией */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0
    }
    // Если запись уже есть, вернуть сразу
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Сохранить и вернуть вариант с большей стоимостью из двух решений
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* Рюкзак 0-1: динамическое программирование */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Инициализация таблицы dp
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // Переход состояний
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c]
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Инициализация таблицы dp
    var dp = Array(repeating: 0, count: cap + 1)
    // Переход состояний
    for i in 1 ... n {
        // Обход в обратном порядке
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum Knapsack {
    /* Driver Code */
    static func main() {
        let wgt = [10, 20, 30, 40, 50]
        let val = [50, 120, 150, 210, 240]
        let cap = 50
        let n = wgt.count

        // Полный перебор
        var res = knapsackDFS(wgt: wgt, val: val, i: n, c: cap)
        print("Максимальная стоимость предметов без превышения вместимости рюкзака = \(res)")

        // Поиск с мемоизацией
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("Максимальная стоимость предметов без превышения вместимости рюкзака = \(res)")

        // Динамическое программирование
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость предметов без превышения вместимости рюкзака = \(res)")

        // Динамическое программирование с оптимизацией памяти
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость предметов без превышения вместимости рюкзака = \(res)")
    }
}
