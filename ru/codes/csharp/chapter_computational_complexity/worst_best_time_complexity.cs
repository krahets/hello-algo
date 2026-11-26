/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* Создать массив из чисел { 1, 2, ..., n } в случайном порядке */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Создать массив nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // Случайно перемешать элементы массива
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* Найти индекс числа 1 в массиве nums */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // Если 1 стоит в начале массива, сложность минимальна: O(1)
            // Если 1 стоит в конце массива, сложность максимальна: O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* Основная программа */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\nМассив [ 1, 2, ..., n ] после перемешивания = " + string.Join(",", nums));
            Console.WriteLine("Индекс числа 1: " + index);
        }
    }
}
