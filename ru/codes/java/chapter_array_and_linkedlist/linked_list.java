/**
 * File: linked_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import utils.*;

public class linked_list {
    /* Вставить узел P после узла n0 */
    static void insert(ListNode n0, ListNode P) {
        ListNode n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* Удалить первый узел, следующий за n0 */
    static void remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode n1 = P.next;
        n0.next = n1;
    }

    /* Получить узел списка по индексу index */
    static ListNode access(ListNode head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* Найти первый узел списка со значением target */
    static int find(ListNode head, int target) {
        int index = 0;
        while (head != null) {
            if (head.val == target)
                return index;
            head = head.next;
            index++;
        }
        return -1;
    }

    /* Демонстрационный код */
    public static void main(String[] args) {
        /* Инициализация связного списка */
        // Инициализировать узлы
        ListNode n0 = new ListNode(1);
        ListNode n1 = new ListNode(3);
        ListNode n2 = new ListNode(2);
        ListNode n3 = new ListNode(5);
        ListNode n4 = new ListNode(4);
        // Связать узлы ссылками
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        System.out.println("Исходный связный список:");
        PrintUtil.printLinkedList(n0);

        /* Вставка узла */
        insert(n0, new ListNode(0));
        System.out.println("Связный список после вставки:");
        PrintUtil.printLinkedList(n0);

        /* Удаление узла */
        remove(n0);
        System.out.println("Связный список после удаления:");
        PrintUtil.printLinkedList(n0);

        /* Доступ к узлу */
        ListNode node = access(n0, 3);
        System.out.println("Значение узла по индексу 3 = " + node.val);

        /* Поиск узла */
        int index = find(n0, 2);
        System.out.println("Индекс узла со значением 2 = " + index);
    }
}
