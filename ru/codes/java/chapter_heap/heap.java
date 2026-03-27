/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void testPush(Queue<Integer> heap, int val) {
        heap.offer(val); // Добавить элемент в кучу
        System.out.format("\nЭлемент %d после добавления в кучу\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Извлечь верхний элемент из кучи
        System.out.format("\nПосле извлечения верхнего элемента %d из кучи\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Инициализироватькуча */
        // Инициализировать min-кучу
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Инициализировать max-кучу (достаточно изменить Comparator с помощью lambda-выражения)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nСледующие тестовые примеры относятся к max-куче");

        /* Добавить элемент в кучу */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Получить верхний элемент кучи */
        int peek = maxHeap.peek();
        System.out.format("\nЭлемент на вершине кучи равен %d\n", peek);

        /* Извлечь верхний элемент из кучи */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* Получить размер кучи */
        int size = maxHeap.size();
        System.out.format("\nКоличество элементов в куче равно %d\n", size);

        /* Проверить, пуста ли куча */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nкучапуст ли %b\n", isEmpty);

        /* Входсписокипостроение кучи */
        // Временная сложность равна O(n), а не O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nПосле построения min-кучи по входному списку");
        PrintUtil.printHeap(minHeap);
    }
}
