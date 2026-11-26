/**
 * File: bucket_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bucket_sort {
    /* Блочная сортировка */
    static void bucketSort(float[] nums) {
        // Создать k = n/2 блоков в расчёте на два элемента в каждом
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. Распределить элементы массива по блокам
        for (float num : nums) {
            // Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
            int i = (int) (num * k);
            // Добавить num в блок i
            buckets.get(i).add(num);
        }
        // 2. Отсортировать каждый блок
        for (List<Float> bucket : buckets) {
            // Используем встроенную сортировку. Её можно заменить другим алгоритмом
            Collections.sort(bucket);
        }
        // 3. Обойти блоки и объединить результаты
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // Входные данные — числа с плавающей точкой из интервала [0, 1)
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("После блочной сортировки nums = " + Arrays.toString(nums));
    }
}
