/**
 * File: max_capacity.js
 * Created Time: 2023-09-02
 * Author: Justin (xiefahit@gmail.com)
 */

/* Максимальная вместимость: жадный алгоритм */
function maxCapacity(ht) {
    // Ставим i и j на противоположные концы массива
    let i = 0,
        j = ht.length - 1;
    // Изначально максимальная вместимость равна 0
    let res = 0;
    // Повторяем жадный выбор, пока перегородки не встретятся
    while (i < j) {
        // Обновляем максимальную вместимость
        const cap = Math.min(ht[i], ht[j]) * (j - i);
        res = Math.max(res, cap);
        // Сдвигаем указатель у более низкой перегородки к центру
        if (ht[i] < ht[j]) {
            i += 1;
        } else {
            j -= 1;
        }
    }
    return res;
}

/* Пример запуска */
const ht = [3, 8, 5, 2, 7, 7, 3, 4];

// Жадный алгоритм
const res = maxCapacity(ht);
console.log(`Максимальная вместимость: ${res}`);
