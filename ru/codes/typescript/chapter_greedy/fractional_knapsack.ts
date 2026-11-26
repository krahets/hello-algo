/**
 * File: fractional_knapsack.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Предмет */
class Item {
    w: number; // Вес предмета
    v: number; // Стоимость предмета

    constructor(w: number, v: number) {
        this.w = w;
        this.v = v;
    }
}

/* Дробный рюкзак: жадный алгоритм */
function fractionalKnapsack(wgt: number[], val: number[], cap: number): number {
    // Создаём список предметов с двумя свойствами: весом и стоимостью
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
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
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// Жадный алгоритм
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`Максимальная стоимость при заданной вместимости рюкзака: ${res}`);

export {};
