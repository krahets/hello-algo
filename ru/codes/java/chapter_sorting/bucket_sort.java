/**
 * File: bucket_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bucket_sort {
    /* Сортировка корзинами */
    static void bucketSort(float[] nums) {
        // Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. Распределить элементы массива по корзинам
        for (float num : nums) {
            // Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
            int i = (int) (num * k);
            // Добавить num в корзину i
            buckets.get(i).add(num);
        }
        // 2. Выполнить сортировку внутри каждой корзины
        for (List<Float> bucket : buckets) {
            // Использовать встроенную функцию сортировки; ее также можно заменить другим алгоритмом сортировки
            Collections.sort(bucket);
        }
        // 3. Обойти корзины и объединить результаты
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("После сортировки корзинами nums = " + Arrays.toString(nums));
    }
}
