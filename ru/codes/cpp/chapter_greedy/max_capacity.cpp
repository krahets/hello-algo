/**
 * File: max_capacity.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Максимальная вместимость: жадный алгоритм */
int maxCapacity(vector<int> &ht) {
    // Инициализировать i и j так, чтобы они располагались на двух концах массива
    int i = 0, j = ht.size() - 1;
    // Начальная максимальная вместимость равна 0
    int res = 0;
    // Повторять жадный выбор, пока две доски не встретятся
    while (i < j) {
        // Обновить максимальную вместимость
        int cap = min(ht[i], ht[j]) * (j - i);
        res = max(res, cap);
        // Сдвинуть внутрь более короткую сторону
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> ht = {3, 8, 5, 2, 7, 7, 3, 4};

    // Жадный алгоритм
    int res = maxCapacity(ht);
    cout << "максимальныйвместимостьравно" << res << endl;

    return 0;
}
