/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* Линейный поиск (массив) */
    int LinearSearchArray(int[] nums, int target) {
        // Обход массива
        for (int i = 0; i < nums.Length; i++) {
            // Целевой элемент найден, вернуть его индекс
            if (nums[i] == target)
                return i;
        }
        // Целевой элемент не найден, вернуть -1
        return -1;
    }

    /* Линейный поиск (связный список) */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // Обойти связный список
        while (head != null) {
            // Найти целевой узел и вернуть его
            if (head.val == target)
                return head;
            head = head.next;
        }
        // Целевой узел не найден, вернуть null
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* Выполнить линейный поиск в массиве */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("Индекс целевого элемента 3 = " + index);

        /* Выполнить линейный поиск в связном списке */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("Объект узла со значением 3 = " + node);
    }
}
