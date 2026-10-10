/**
* File: fractional_knapsack.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

/* Предмет */
class Item(int w, int v) {
    public int w = w; // Вес предмета
    public int v = v; // Стоимость предмета
}

public class fractional_knapsack {
    /* Дробный рюкзак: жадный алгоритм */
    double FractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Создать список предметов с двумя свойствами: вес и стоимость
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Отсортировать по удельной стоимости item.v / item.w в порядке убывания
        Array.Sort(items, (x, y) => (y.v / y.w).CompareTo(x.v / x.w));
        // Циклический жадный выбор
        double res = 0;
        foreach (Item item in items) {
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

    [Test]
    public void Test() {
        int[] wgt = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;

        // Жадный алгоритм
        double res = FractionalKnapsack(wgt, val, cap);
        Console.WriteLine("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);
    }
}