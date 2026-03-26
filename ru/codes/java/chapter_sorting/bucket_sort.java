/**
 * File: bucket_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bucket_sort {
    /* Сортировка по бакетам */
    static void bucketSort(float[] nums) {
        // Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. Распределить элементы массива по бакетам
        for (float num : nums) {
            // Входданныедиапазонравно [0, 1), Использовать num * k отобразить виндексдиапазон [0, k-1]
            int i = (int) (num * k);
            // Добавить num в бакет i
            buckets.get(i).add(num);
        }
        // 2. Выполнить сортировку внутри каждого бакета
        for (List<Float> bucket : buckets) {
            // Использовать встроенную функцию сортировки; при необходимости ее можно заменить другим алгоритмом сортировки
            Collections.sort(bucket);
        }
        // 3. Обойти бакеты и объединить результат
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // ПустьВходданныеравночисла с плавающей точкой, диапазонравно [0, 1)
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("Сортировка по бакетампосле завершения nums =" + Arrays.toString(nums));
    }
}
