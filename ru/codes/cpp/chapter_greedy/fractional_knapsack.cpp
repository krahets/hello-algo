/**
 * File: fractional_knapsack.cpp
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Предмет */
class Item {
  public:
    int w; // Вес предмета
    int v; // Стоимость предмета

    Item(int w, int v) : w(w), v(v) {
    }
};

/* Дробный рюкзак: жадный алгоритм */
double fractionalKnapsack(vector<int> &wgt, vector<int> &val, int cap) {
    // Создать список предметов с двумя свойствами: вес и стоимость
    vector<Item> items;
    for (int i = 0; i < wgt.size(); i++) {
        items.push_back(Item(wgt[i], val[i]));
    }
    // Отсортировать по удельной стоимости item.v / item.w в порядке убывания
    sort(items.begin(), items.end(), [](Item &a, Item &b) { return (double)a.v / a.w > (double)b.v / b.w; });
    // Циклический жадный выбор
    double res = 0;
    for (auto &item : items) {
        if (item.w <= cap) {
            // Если оставшейся вместимости достаточно, положить в рюкзак текущий предмет целиком
            res += item.v;
            cap -= item.w;
        } else {
            // Если оставшейся вместимости недостаточно, положить в рюкзак часть текущего предмета
            res += (double)item.v / item.w * cap;
            // Свободной вместимости больше не осталось, поэтому выйти из цикла
            break;
        }
    }
    return res;
}

/* Driver Code */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;

    // Жадный алгоритм
    double res = fractionalKnapsack(wgt, val, cap);
    cout << "Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна " << res << endl;

    return 0;
}
