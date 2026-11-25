/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Максимальная вместимость: жадный алгоритм */
int maxCapacity(vector<int> &ht) {
    // Ставим i и j на противоположные концы массива
    int i = 0, j = ht.size() - 1;
    // Изначально максимальная вместимость равна 0
    int res = 0;
    // Повторяем жадный выбор, пока перегородки не встретятся
    while (i < j) {
        // Обновляем максимальную вместимость
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // Сдвигаем указатель у более низкой перегородки к центру
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Пример запуска */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // Жадный алгоритм
    int res = maxCapacity(ht);
    cout << "Максимальная вместимость: " << res << endl;

    return 0;
}
