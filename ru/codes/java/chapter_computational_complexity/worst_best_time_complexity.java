/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Случайно перемешать элементы массива
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Найти индекс числа 1 в массиве nums */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = randomNumbers(n);
            int index = findOne(nums);
            System.out.println("\nМассив [1, 2, ..., n] после перемешивания = " + Arrays.toString(nums));
            System.out.println("Индекс числа 1 = " + index);
        }
    }
}
