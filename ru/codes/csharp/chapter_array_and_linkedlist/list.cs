/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* Инициализировать список */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("список nums =" + string.Join(",", nums));

        /* Получить доступ к элементу */
        int num = nums[1];
        Console.WriteLine("обратиться киндекс 1 поэлемент, получаем num =" + num);

        /* Обновить элемент */
        nums[1] = 0;
        Console.WriteLine("После обновления элемента по индексу 1 на 0 получаем nums = " + string.Join(",", nums));

        /* Очистить список */
        nums.Clear();
        Console.WriteLine("Очистить списокпосле nums =" + string.Join(",", nums));

        /* Добавить элемент в конец */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("После добавления элемента nums =" + string.Join(",", nums));

        /* Вставить элемент в середину */
        nums.Insert(3, 6);
        Console.WriteLine("После вставки числа 6 по индексу 3 получаем nums = " + string.Join(",", nums));

        /* Удалить элемент */
        nums.RemoveAt(3);
        Console.WriteLine("После удаления элемента по индексу 3 получаем nums =" + string.Join(",", nums));

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
        Console.WriteLine("После присоединения списка nums1 к nums получаем nums =" + string.Join(",", nums));

        /* Отсортировать список */
        nums.Sort(); // Сортировкапосле, списокэлементрасположены по возрастанию
        Console.WriteLine("Отсортировать списокпосле nums =" + string.Join(",", nums));
    }
}
