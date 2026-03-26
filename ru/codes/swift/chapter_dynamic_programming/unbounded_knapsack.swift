/**
 * File: unbounded_knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Неограниченный рюкзак: динамическое программирование */
func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Инициализировать таблицу dp
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // Переход состояния
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // Если вместимость рюкзака превышена, не брать предмет i
                dp[i][c] = dp[i - 1][c]
            } else {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Неограниченный рюкзак: динамическое программирование с оптимизацией памяти */
func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // Инициализировать таблицу dp
    var dp = Array(repeating: 0, count: cap + 1)
    // Переход состояния
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // Если вместимость рюкзака превышена, не брать предмет i
                dp[c] = dp[c]
            } else {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum UnboundedKnapsack {
    /* Driver Code */
    static func main() {
        let wgt = [1, 2, 3]
        let val = [5, 11, 15]
        let cap = 4

        // Динамическое программирование
        var res = unboundedKnapsackDP(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна \(res)")

        // Динамическое программирование с оптимизацией по памяти
        res = unboundedKnapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна \(res)")
    }
}
