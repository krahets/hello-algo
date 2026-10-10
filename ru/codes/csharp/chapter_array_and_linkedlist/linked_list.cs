// File: linked_list.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class linked_list {
    /* Вставить узел P после узла n0 в связном списке */
    void Insert(ListNode n0, ListNode P) {
        ListNode? n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* Удалить первый узел после узла n0 в связном списке */
    void Remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode? n1 = P.next;
        n0.next = n1;
    }

    /* Доступ к узлу связного списка по индексу index */
    ListNode? Access(ListNode? head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* Найти в связном списке первый узел со значением target */
    int Find(ListNode? head, int target) {
        int index = 0;
        while (head != null) {
            if (head.val == target)
                return index;
            head = head.next;
            index++;
        }
        return -1;
    }


    [Test]
    public void Test() {
        // Инициализация связного списка
        // Инициализация всех узлов
        ListNode n0 = new(1);
        ListNode n1 = new(3);
        ListNode n2 = new(2);
        ListNode n3 = new(5);
        ListNode n4 = new(4);
        // Построить ссылки между узлами
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        Console.WriteLine($"Исходный связный список: {n0}");

        // Вставка узла
        Insert(n0, new ListNode(0));
        Console.WriteLine($"Связный список после вставки узла: {n0}");

        // Удаление узла
        Remove(n0);
        Console.WriteLine($"Связный список после удаления узла: {n0}");

        // Доступ к узлу
        ListNode? node = Access(n0, 3);
        Console.WriteLine($"Значение узла по индексу 3 в связном списке = {node?.val}");

        // Поиск узла
        int index = Find(n0, 2);
        Console.WriteLine($"Индекс узла со значением 2 в связном списке = {index}");
    }
}
