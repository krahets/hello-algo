/**
 * File: fractional_knapsack.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Предмет */
class Item {
    var w: Int // Вес предмета
    var v: Int // Стоимость предмета

    init(w: Int, v: Int) {
        self.w = w
        self.v = v
    }
}

/* Дробный рюкзак: жадный алгоритм */
func fractionalKnapsack(wgt: [Int], val: [Int], cap: Int) -> Double {
    // Создаём список предметов с двумя свойствами: весом и стоимостью
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // Сортируем по убыванию удельной стоимости item.v / item.w
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // На каждом шаге делаем жадный выбор
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // Если места достаточно, кладём предмет целиком
            res += Double(item.v)
            cap -= item.w
        } else {
            // Если места недостаточно, кладём часть предмета
            res += Double(item.v) / Double(item.w) * Double(cap)
            // Рюкзак заполнен, выходим из цикла
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* Пример запуска */
    static func main() {
        // Вес предмета
        let wgt = [10, 20, 30, 40, 50]
        // Стоимость предмета
        let val = [50, 120, 150, 210, 240]
        // Вместимость рюкзака
        let cap = 50

        // Жадный алгоритм
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость при заданной вместимости рюкзака: \(res)")
    }
}
