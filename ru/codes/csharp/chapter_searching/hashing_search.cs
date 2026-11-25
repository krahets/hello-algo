/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* Поиск по хеш-таблице в массиве */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // Ключ хеш-таблицы — искомый элемент, значение — его индекс
        // Если ключа в хеш-таблице нет, возвращаем -1
        return map.GetValueOrDefault(target, -1);
    }

    /* Поиск по хеш-таблице в связном списке */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
        // Если ключа в хеш-таблице нет, возвращаем null
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* Поиск по хеш-таблице в массиве */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // Создаём хеш-таблицу
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // Ключ — элемент, значение — индекс
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("Индекс элемента 3 = " + index);

        /* Поиск по хеш-таблице в связном списке */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // Создаём хеш-таблицу
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // Ключ — значение узла, значение — сам узел
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("Узел со значением 3: " + node);
    }
}
