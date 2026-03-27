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
    // Создать список предметов с двумя свойствами: вес и стоимость
    var items = zip(wgt, val).map { Item(w: $0, v: $1) }
    // Отсортировать по удельной стоимости item.v / item.w в порядке убывания
    items.sort { -(Double($0.v) / Double($0.w)) < -(Double($1.v) / Double($1.w)) }
    // Циклический жадный выбор
    var res = 0.0
    var cap = cap
    for item in items {
        if item.w <= cap {
            // Если оставшейся вместимости достаточно, положить в рюкзак текущий предмет целиком
            res += Double(item.v)
            cap -= item.w
        } else {
            // Если оставшейся вместимости недостаточно, положить в рюкзак часть текущего предмета
            res += Double(item.v) / Double(item.w) * Double(cap)
            // Свободной вместимости больше не осталось, поэтому выйти из цикла
            break
        }
    }
    return res
}

@main
enum FractionalKnapsack {
    /* Driver Code */
    static func main() {
        // Вес предмета
        let wgt = [10, 20, 30, 40, 50]
        // Стоимость предмета
        let val = [50, 120, 150, 210, 240]
        // Вместимость рюкзака
        let cap = 50

        // Жадный алгоритм
        let res = fractionalKnapsack(wgt: wgt, val: val, cap: cap)
        print("Максимальная стоимость предметов без превышения вместимости рюкзака = \(res)")
    }
}
