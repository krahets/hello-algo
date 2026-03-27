/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* Максимальная вместимость: жадный алгоритм */
    int MaxCapacity(int[] ht) {
        // Инициализировать i и j так, чтобы они располагались по двум концам массива
        int i = 0, j = ht.Length - 1;
        // Начальная максимальная вместимость равна 0
        int res = 0;
        // Выполнять жадный выбор в цикле, пока две доски не встретятся
        while (i < j) {
            // Обновить максимальную вместимость
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // Сдвигать внутрь более короткую сторону
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] ht = [3, 8, 5, 2, 7, 7, 3, 4];

        // Жадный алгоритм
        int res = MaxCapacity(ht);
        Console.WriteLine("Максимальная вместимость = " + res);
    }
}