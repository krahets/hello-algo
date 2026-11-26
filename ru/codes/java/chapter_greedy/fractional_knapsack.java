/**
 * File: fractional_knapsack.java
 * Created Time: 2023-07-20
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.util.Arrays;
import java.util.Comparator;

/* Предмет */
class Item {
    int w; // Вес предмета
    int v; // Стоимость предмета

    public Item(int w, int v) {
        this.w = w;
        this.v = v;
    }
}

public class fractional_knapsack {
    /* Дробный рюкзак: жадный алгоритм */
    static double fractionalKnapsack(int[] wgt, int[] val, int cap) {
        // Создаём список предметов с двумя свойствами: весом и стоимостью
        Item[] items = new Item[wgt.length];
        for (int i = 0; i < wgt.length; i++) {
            items[i] = new Item(wgt[i], val[i]);
        }
        // Сортируем по убыванию удельной стоимости item.v / item.w
        Arrays.sort(items, Comparator.comparingDouble(item -> -((double) item.v / item.w)));
        // На каждом шаге делаем жадный выбор
        double res = 0;
        for (Item item : items) {
            if (item.w <= cap) {
                // Если места достаточно, кладём предмет целиком
                res += item.v;
                cap -= item.w;
            } else {
                // Если места недостаточно, кладём часть предмета
                res += (double) item.v / item.w * cap;
                // Рюкзак заполнен, выходим из цикла
                break;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;

        // Жадный алгоритм
        double res = fractionalKnapsack(wgt, val, cap);
        System.out.println("Максимальная стоимость при заданной вместимости рюкзака: " + res);
    }
}
