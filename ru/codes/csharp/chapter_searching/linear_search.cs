/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* Линейный поиск в массиве */
    int LinearSearchArray(int[] nums, int target) {
        // Обходим массив
        for (int i = 0; i < nums.Length; i++) {
            // Элемент найден, возвращаем его индекс
            if (nums[i] == target)
                return i;
        }
        // Элемент не найден, возвращаем -1
        return -1;
    }

    /* Линейный поиск в связном списке */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // Обходим связный список
        while (head != null) {
            // Нужный узел найден, возвращаем его
            if (head.val == target)
                return head;
            head = head.next;
        }
        // Нужный узел не найден, возвращаем null
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* Выполняем линейный поиск в массиве */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("Индекс элемента 3 = " + index);

        /* Выполняем линейный поиск в связном списке */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("Узел со значением 3: " + node);
    }
}
