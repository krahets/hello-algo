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
    // Создать список предметов с двумя свойствами: вес и стоимость
    const items: Item[] = wgt.map((w, i) => new Item(w, val[i]));
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
const wgt: number[] = [10, 20, 30, 40, 50];
const val: number[] = [50, 120, 150, 210, 240];
const cap: number = 50;

// Жадный алгоритм
const res: number = fractionalKnapsack(wgt, val, cap);
console.log(`Максимальная стоимость предметов без превышения вместимости рюкзака = ${res}`);

export {};
