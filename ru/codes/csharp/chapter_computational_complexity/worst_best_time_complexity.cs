/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* Сгенерировать массив из элементов { 1, 2, ..., n } в перемешанном порядке */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // Сгенерировать массив nums = { 1, 2, 3, ..., n }
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
            // Когда элемент 1 находится в начале массива, достигается наилучшая временная сложность O(1)
            // Когда элемент 1 находится в конце массива, достигается наихудшая временная сложность O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* Driver Code */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\nПосле перемешивания массива [ 1, 2, ..., n ] = " + string.Join(",", nums));
            Console.WriteLine("Индекс числа 1 равен " + index);
        }
    }
}
