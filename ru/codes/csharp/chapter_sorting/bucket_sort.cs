/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* Сортировка корзинами */
    void BucketSort(float[] nums) {
        // Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. Распределить элементы массива по корзинам
        foreach (float num in nums) {
            // Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
            int i = (int)(num * k);
            // Добавить num в корзину i
            buckets[i].Add(num);
        }
        // 2. Выполнить сортировку внутри каждой корзины
        foreach (List<float> bucket in buckets) {
            // Использовать встроенную функцию сортировки; ее также можно заменить другим алгоритмом сортировки
            bucket.Sort();
        }
        // 3. Обойти корзины и объединить результаты
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("После сортировки корзинами nums = " + string.Join(" ", nums));
    }
}
