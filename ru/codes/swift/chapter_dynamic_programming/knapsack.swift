/**
 * File: knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Рюкзак 0–1: полный перебор */
func knapsackDFS(wgt: [Int], val: [Int], i: Int, c: Int) -> Int {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if wgt[i - 1] > c {
        return knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    let no = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c)
    let yes = knapsackDFS(wgt: wgt, val: val, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Вернуть большую из двух стоимостей
    return max(no, yes)
}

/* Рюкзак 0–1: поиск с мемоизацией */
func knapsackDFSMem(wgt: [Int], val: [Int], mem: inout [[Int]], i: Int, c: Int) -> Int {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if i == 0 || c == 0 {
        return 0
    }
    // Если результат сохранён, сразу вернуть его
    if mem[i][c] != -1 {
        return mem[i][c]
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if wgt[i - 1] > c {
        return knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    let no = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c)
    let yes = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: i - 1, c: c - wgt[i - 1]) + val[i - 1]
    // Сохранить и вернуть большую из двух стоимостей
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* Рюкзак 0–1: динамическое программирование */
func knapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Инициализировать таблицу dp
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // Переход между состояниями
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c]
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Рюкзак 0–1: динамическое программирование с экономией памяти */
func knapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Инициализировать таблицу dp
    var dp = Array(repeating: 0, count: cap + 1)
    // Переход между состояниями
    for i in 1 ... n {
        // Обход в обратном порядке
        for c in (1 ... cap).reversed() {
            if wgt[i - 1] <= c {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum Knapsack {
    /* Основная программа */
    static func main() {
        let wgt = [10, 20, 30, 40, 50]
        let val = [50, 120, 150, 210, 240]
        let cap = 50
        let n = wgt.count

        // Полный перебор
        var res = knapsackDFS(wgt: wgt, val: val, i: n, c: cap)
        print("Максимальная стоимость предметов, помещающихся в рюкзак: \(res)")

        // Поиск с мемоизацией
        var mem = Array(repeating: Array(repeating: -1, count: cap + 1), count: n + 1)
        res = knapsackDFSMem(wgt: wgt, val: val, mem: &mem, i: n, c: cap)
        print("Максимальная стоимость предметов, помещающихся в рюкзак: \(res)")

        // Динамическое программирование
        res = knapsackDP(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость предметов, помещающихся в рюкзак: \(res)")

        // Динамическое программирование с экономией памяти
        res = knapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость предметов, помещающихся в рюкзак: \(res)")
    }
}
