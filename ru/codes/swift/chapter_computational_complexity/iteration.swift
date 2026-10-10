/**
 * File: iteration.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Цикл for */
func forLoop(n: Int) -> Int {
    var res = 0
    // Циклическое суммирование 1, 2, ..., n-1, n
    for i in 1 ... n {
        res += i
    }
    return res
}

/* Цикл while */
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1 // Инициализация условной переменной
    // Циклическое суммирование 1, 2, ..., n-1, n
    while i <= n {
        res += i
        i += 1 // Обновить условную переменную
    }
    return res
}

/* Цикл while (двойное обновление) */
func whileLoopII(n: Int) -> Int {
    var res = 0
    var i = 1 // Инициализация условной переменной
    // Циклическое суммирование 1, 4, 10, ...
    while i <= n {
        res += i
        // Обновить условную переменную
        i += 1
        i *= 2
    }
    return res
}

/* Двойной цикл for */
func nestedForLoop(n: Int) -> String {
    var res = ""
    // Цикл по i = 1, 2, ..., n-1, n
    for i in 1 ... n {
        // Цикл по j = 1, 2, ..., n-1, n
        for j in 1 ... n {
            res.append("(\(i), \(j)), ")
        }
    }
    return res
}

@main
enum Iteration {
    /* Driver Code */
    static func main() {
        let n = 5
        var res = 0

        res = forLoop(n: n)
        print("\nРезультат суммирования в цикле for res = \(res)")

        res = whileLoop(n: n)
        print("\nРезультат суммирования в цикле while res = \(res)")

        res = whileLoopII(n: n)
        print("\nРезультат суммирования в цикле while (двойное обновление) res = \(res)")

        let resStr = nestedForLoop(n: n)
        print("\nРезультат обхода в двойном цикле for \(resStr)")
    }
}
