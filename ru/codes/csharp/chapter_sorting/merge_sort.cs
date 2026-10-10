/**
 * File: merge_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class merge_sort {
    /* Объединить левый и правый подмассивы */
    void Merge(int[] nums, int left, int mid, int right) {
        // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
        // Создать временный массив tmp для хранения результата слияния
        int[] tmp = new int[right - left + 1];
        // Инициализировать начальные индексы левого и правого подмассивов
        int i = left, j = mid + 1, k = 0;
        // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    void MergeSort(int[] nums, int left, int right) {
        // Условие завершения
        if (left >= right) return;       // Завершить рекурсию, когда длина подмассива равна 1
        // Этап разбиения
        int mid = left + (right - left) / 2;    // Вычислить середину
        MergeSort(nums, left, mid);      // Рекурсивно обработать левый подмассив
        MergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
        // Этап слияния
        Merge(nums, left, mid, right);
    }

    [Test]
    public void Test() {
        /* Сортировка слиянием */
        int[] nums = [7, 3, 2, 6, 0, 1, 5, 4];
        MergeSort(nums, 0, nums.Length - 1);
        Console.WriteLine("После сортировки слиянием nums = " + string.Join(",", nums));
    }
}
