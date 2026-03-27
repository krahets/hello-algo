/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* Бэктрекинг */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Перебор всех вариантов выбора
        for (Integer choice : choices) {
            // Отсечение: нельзя выходить за n-ю ступень
            if (state + choice > n)
                continue;
            // Попытка: сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res);
            // Откат
        }
    }

    /* Подъем по лестнице: бэктрекинг */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Можно подняться на 1 или 2 ступени
        int state = 0; // Начать подъем с 0-й ступени
        List<Integer> res = new ArrayList<>();
        res.add(0); // Использовать res[0] для хранения числа решений
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("Количество способов подняться по лестнице из %d ступеней: %d", n, res));
    }
}
