// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* Чтение случайного элемента */
    int RandomAccess(int[] nums) {
        Random random = new();
        // Выбрать случайное число из интервала [0, nums.Length)
        int randomIndex = random.Next(nums.Length);
        // Получить и вернуть случайный элемент
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Увеличение длины массива */
    int[] Extend(int[] nums, int enlarge) {
        // Создать массив увеличенной длины
        int[] res = new int[nums.Length + enlarge];
        // Скопировать все элементы исходного массива в новый
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // Вернуть новый массив увеличенной длины
        return res;
    }

    /* Вставить num в массив по индексу index */
    void Insert(int[] nums, int num, int index) {
        // Сдвинуть на одну позицию вправо все элементы начиная с index
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Записать num по индексу index
        nums[index] = num;
    }

    /* Удалить элемент по индексу index */
    void Remove(int[] nums, int index) {
        // Сдвинуть все элементы после index на одну позицию влево
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Обход массива */
    void Traverse(int[] nums) {
        int count = 0;
        // Обойти массив по индексам
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // Перебрать элементы массива напрямую
        foreach (int num in nums) {
            count += num;
        }
    }

    /* Поиск заданного элемента в массиве */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Вспомогательная функция преобразования массива в строку */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // Инициализация массива
        int[] arr = new int[5];
        Console.WriteLine("Массив arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("Массив nums = " + ToString(nums));

        // Чтение случайного элемента
        int randomNum = RandomAccess(nums);
        Console.WriteLine("Случайный элемент nums: " + randomNum);

        // Увеличение длины
        nums = Extend(nums, 3);
        Console.WriteLine("После увеличения длины массива до 8 nums = " + ToString(nums));

        // Вставка элемента
        Insert(nums, 6, 3);
        Console.WriteLine("После вставки числа 6 по индексу 3 nums = " + ToString(nums));

        // Удаление элемента
        Remove(nums, 2);
        Console.WriteLine("После удаления элемента по индексу 2 nums = " + ToString(nums));

        // Обход массива
        Traverse(nums);

        // Поиск элемента 
        int index = Find(nums, 3);
        Console.WriteLine("Индекс элемента 3 в nums = " + index);
    }
}
