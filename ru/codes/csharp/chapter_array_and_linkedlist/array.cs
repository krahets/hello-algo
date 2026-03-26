// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* Случайный доступ к элементу */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Случайно выбрать число в интервале [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Получить и вернуть случайный элемент
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Увеличить длину массива */
    int[] Extend(int[] nums, int enlarge) {
        // Инициализировать массив увеличенной длины
        int[] res = new int[nums.Length + enlarge];
        // Скопировать все элементы исходного массива в новый массив
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Вернуть новый расширенный массив
        return res;
    }

    /* Вставить элемент num в массив по индексу index */
    void Insert(int[] nums, int num, int index) {
        // Сдвинуть индекс index и все последующие элементы на одну позицию назад
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }

    /* Удалить элемент по индексу index */
    void Remove(int[] nums, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Перебрать массив */
    void Traverse(int[] nums) {
        int count = 0;
        // Обходить массив по индексам
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Непосредственно обходить элементы массива
        foreach (int num in nums) {
            count += num;
        }
    }

    /* Найти заданный элемент в массиве */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Вспомогательная функция: преобразование массива в строку */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // Инициализировать массив
        int[] arr = new int[5];
        Console.WriteLine("массив arr =" + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("массив nums =" + ToString(nums));

        // Случайный доступ
        int randomNum = RandomAccess(nums);
        Console.WriteLine("Полученный случайный элемент из nums" + randomNum);

        // Расширение длины
        nums = Extend(nums, 3);
        Console.WriteLine("После расширения длины массива до 8 получаем nums =" + ToString(nums));

        // Вставить элемент
        Insert(nums, 6, 3);
        Console.WriteLine("После вставки числа 6 по индексу 3 получаем nums = " + ToString(nums));

        // Удалить элемент
        Remove(nums, 2);
        Console.WriteLine("После удаления элемента по индексу 2 получаем nums =" + ToString(nums));

        // Перебрать массив
        Traverse(nums);

        // Найти элемент
        int index = Find(nums, 3);
        Console.WriteLine("Поиск элемента 3 в nums дает индекс =" + index);
    }
}
