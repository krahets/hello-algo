/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* Блочная сортировка */
    void BucketSort(float[] nums) {
        // Создать k = n/2 блоков в расчёте на два элемента в каждом
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. Распределить элементы массива по блокам
        foreach (float num in nums) {
            // Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
            int i = (int)(num * k);
            // Добавить num в блок i
            buckets[i].Add(num);
        }
        // 2. Отсортировать каждый блок
        foreach (List<float> bucket in buckets) {
            // Используем встроенную сортировку. Её можно заменить другим алгоритмом
            bucket.Sort();
        }
        // 3. Обойти блоки и объединить результаты
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // Входные данные — числа с плавающей точкой из интервала [0, 1)
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("После блочной сортировки nums = " + string.Join(" ", nums));
    }
}
