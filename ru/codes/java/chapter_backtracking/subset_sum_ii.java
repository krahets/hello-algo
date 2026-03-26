/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* Алгоритм бэктрекинга: сумма подмножества II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации дублирующихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (int i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, сразу завершить цикл
            // Это связано с тем, что массив уже отсортирован, последующие элементы больше, поэтому сумма подмножества обязательно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Отсечение 4: если этот элемент равен элементу слева, значит данная ветвь поиска дублируется, ее нужно сразу пропустить
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Попытка: сделать выбор и обновить target, start
            state.add(choices[i]);
            // Перейти к следующему варианту выбора
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Решить задачу суммы подмножества II */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        Arrays.sort(nums); // Отсортировать nums
        int start = 0; // Обход начальной вершины
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("Входмассив nums =" + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Все подмножества с суммой" + target + "res =" + res);
    }
}
