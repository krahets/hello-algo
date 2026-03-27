/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* Инициализация списка */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("Список nums = " + string.Join(",", nums));

        /* Доступ к элементу */
        int num = nums[1];
        Console.WriteLine("Элемент по индексу 1: num = " + num);

        /* Обновление элемента */
        nums[1] = 0;
        Console.WriteLine("После обновления элемента по индексу 1 до 0 nums = " + string.Join(",", nums));

        /* Очистить список */
        nums.Clear();
        Console.WriteLine("После очистки списка nums = " + string.Join(",", nums));

        /* Добавление элемента в конец */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("После добавления элементов nums = " + string.Join(",", nums));

        /* Вставка элемента в середину */
        nums.Insert(3, 6);
        Console.WriteLine("После вставки числа 6 по индексу 3 nums = " + string.Join(",", nums));

        /* Удаление элемента */
        nums.RemoveAt(3);
        Console.WriteLine("После удаления элемента по индексу 3 nums = " + string.Join(",", nums));

        /* Обходить список по индексам */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }
        /* Непосредственно обходить элементы списка */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }

        /* Объединить два списка */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1);
        Console.WriteLine("После конкатенации списка nums1 к nums nums = " + string.Join(",", nums));

        /* Отсортировать список */
        nums.Sort(); // После сортировки элементы списка располагаются по возрастанию
        Console.WriteLine("После сортировки списка nums = " + string.Join(",", nums));
    }
}
