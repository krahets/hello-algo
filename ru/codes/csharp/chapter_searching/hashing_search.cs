/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* Хеш-поиск (массив) */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // key хеш-таблицы: целевой элемент, value: индекс
        // Если такого key нет в хеш-таблице, вернуть -1
        return map.GetValueOrDefault(target, -1);
    }

    /* Хеш-поиск (связный список) */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // key хеш-таблицы: значение целевого узла, value: объект узла
        // Если такого key нет в хеш-таблице, вернуть null
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* Хеш-поиск (массив) */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // Инициализация хеш-таблицы
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // key: элемент, value: индекс
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("Индекс целевого элемента 3 = " + index);

        /* Хеш-поиск (связный список) */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // Инициализация хеш-таблицы
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // key: значение узла, value: узел
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("Объект узла со значением 3 = " + node);
    }
}
