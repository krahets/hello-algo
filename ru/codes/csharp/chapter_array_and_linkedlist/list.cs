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

        // [region]{access_element}
        /* Доступ к элементу */
        int num = nums[1]; // Доступ к элементу по индексу 1
        // [endregion]{access_element}
        Console.WriteLine("Элемент по индексу 1: num = " + num);

        // [region]{update_element}
        /* Изменение элемента */
        nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
        // [endregion]{update_element}
        Console.WriteLine("После изменения значения элемента с индексом 1 на 0 nums = " + string.Join(",", nums));

        // [region]{clear_list}
        /* Очистить список */
        nums.Clear();
        // [endregion]{clear_list}
        Console.WriteLine("После очистки списка nums = " + string.Join(",", nums));

        // [region]{append_element}
        /* Добавление элемента в конец */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        // [endregion]{append_element}
        Console.WriteLine("После добавления элементов nums = " + string.Join(",", nums));

        // [region]{insert_element}
        /* Вставка элемента в середину */
        nums.Insert(3, 6); // Вставить число 6 по индексу 3
        // [endregion]{insert_element}
        Console.WriteLine("После вставки числа 6 по индексу 3 nums = " + string.Join(",", nums));

        // [region]{remove_element}
        /* Удаление элемента */
        nums.RemoveAt(3); // Удалить элемент по индексу 3
        // [endregion]{remove_element}
        Console.WriteLine("После удаления элемента по индексу 3 nums = " + string.Join(",", nums));

        // [region]{iterate_list}
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
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* Объединить два списка */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1); // Присоединить список nums1 к концу nums
        // [endregion]{concat_list}
        Console.WriteLine("После конкатенации списка nums1 к nums nums = " + string.Join(",", nums));

        // [region]{sort_list}
        /* Отсортировать список */
        nums.Sort(); // После сортировки элементы списка располагаются по возрастанию
        // [endregion]{sort_list}
        Console.WriteLine("После сортировки списка nums = " + string.Join(",", nums));
    }
}
