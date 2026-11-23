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
    // Создать список предметов с двумя свойствами: вес и стоимость
    const items = wgt.map((w, i) => new Item(w, val[i]));
    // Отсортировать по удельной стоимости item.v / item.w в порядке убывания
    items.sort((a, b) => b.v / b.w - a.v / a.w);
    // Циклический жадный выбор
    let res = 0;
    for (const item of items) {
        if (item.w <= cap) {
            // Если оставшейся вместимости достаточно, положить в рюкзак текущий предмет целиком
            res += item.v;
            cap -= item.w;
        } else {
            // Если оставшейся вместимости недостаточно, положить в рюкзак часть текущего предмета
            res += (item.v / item.w) * cap;
            // Свободной вместимости больше не осталось, поэтому выйти из цикла
            break;
        }
    }
    return res;
}

/* Driver Code */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Жадный алгоритм
const res = fractionalKnapsack(wgt, val, cap);
console.log(`Максимальная стоимость предметов без превышения вместимости рюкзака = ${res}`);
