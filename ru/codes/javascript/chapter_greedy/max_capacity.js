/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Максимальная вместимость: жадный алгоритм */
function maxCapacity(ht) {
    // Инициализировать i и j так, чтобы они располагались по двум концам массива
    let i = 0,
        j = ht.length - 1;
    // Начальная максимальная вместимость равна 0
    let res = 0;
    // Выполнять жадный выбор в цикле, пока две доски не встретятся
    while (i < j) {
        // Обновить максимальную вместимость
        const cap = Math.min(ht[i], ht[j]) * (j - i);
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
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// Жадный алгоритм
const res = maxCapacity(ht);
console.log(`Максимальная вместимость = ${res}`);
