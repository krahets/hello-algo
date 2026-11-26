/**
 * File: fractional_knapsack.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Предмет */
class Item {
    constructor(w, v) {
        this.w = w; // Вес предмета
        this.v = v; // Стоимость предмета
    }
}

/* Дробный рюкзак: жадный алгоритм */
function fractionalKnapsack(wgt, val, cap) {
    // Создаём список предметов с двумя свойствами: весом и стоимостью
    const items = wgt.map((w, i) => new Item(w, val[i]));
    // Сортируем по убыванию удельной стоимости item.v / item.w
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // На каждом шаге делаем жадный выбор
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // Если места достаточно, кладём предмет целиком
            res += item.v;
            cap -= item.w;
        } else {
            // Если места недостаточно, кладём часть предмета
            res += (item.v / item.w) * cap;
            // Рюкзак заполнен, выходим из цикла
            break;
        }
    }
    return res;
}

/* Пример запуска */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Жадный алгоритм
const res = fractionalKnapsack(wgt, val, cap);
console.log(`Максимальная стоимость при заданной вместимости рюкзака: ${res}`);
