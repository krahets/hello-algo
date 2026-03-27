/**
 * File: max_capacity.ts
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Максимальная вместимость: жадный алгоритм */
function maxCapacity(ht: number[]): number {
    // Инициализировать i и j так, чтобы они располагались по двум концам массива
    let i = 0,
        j = ht.length - 1;
    // Начальная максимальная вместимость равна 0
    let res = 0;
    // Выполнять жадный выбор в цикле, пока две доски не встретятся
    while (i < j) {
        // Обновить максимальную вместимость
        const cap: number = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // Сдвигать внутрь более короткую сторону
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Driver Code */
const ht: number[] = [3, 8, 5, 2, 7, 7, 3, 4];

// Жадный алгоритм
const res: number = maxCapacity(ht);
console.log(`Максимальная вместимость = ${res}`);

export {};
