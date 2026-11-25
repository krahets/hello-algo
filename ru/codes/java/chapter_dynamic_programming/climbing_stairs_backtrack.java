/**
 * File: climbing_stairs_backtrack.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.*;

public class climbing_stairs_backtrack {
    /* Поиск с возвратом */
    public static void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // На ступени n увеличить число способов на 1
        if (state == n)
            res.set(0, res.get(0) + 1);
        // Перебрать все варианты
        for (Integer choice : choices) {
            // Отсечь шаги за ступень n
            if (state + choice > n)
                continue;
            // Сделать выбор и обновить состояние
            backtrack(choices, state + choice, n, res);
            // Отменить выбор
        }
    }

    /* Подъём по лестнице: поиск с возвратом */
    public static int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // Можно подняться на 1 или 2 ступени
        int state = 0; // Начать со ступени 0
        List<Integer> res = new ArrayList<>();
        res.add(0); // Хранить число способов в res[0]
        backtrack(choices, state, n, res);
        return res.get(0);
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsBacktrack(n);
        System.out.println(String.format("Число способов подняться на лестницу из %d ступеней: %d.", n, res));
    }
}
