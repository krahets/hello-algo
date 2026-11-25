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
        // Создаём список предметов с двумя свойствами: весом и стоимостью
        Item[] items = new Item[wgt.Length];
        for (int i = 0; i < wgt.Length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Сортируем по убыванию удельной стоимости item.v / item.w
        Array.Sort(items, (x, y) => ((double)y.v / y.w).CompareTo((double)x.v / x.w));
        // На каждом шаге делаем жадный выбор
        double res = 0;
        foreach (Item item in items) {
            if (item.w <= cap) {
                // Если места достаточно, кладём предмет целиком
                res += item.v;
                cap -= item.w;
            } else {
                // Если места недостаточно, кладём часть предмета
                res += (double)item.v / item.w * cap;
                // Рюкзак заполнен, выходим из цикла
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
        Console.WriteLine("Максимальная стоимость при заданной вместимости рюкзака: " + res);
    }
}