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
        heap.offer(val); // Добавление элемента в кучу
        System.out.format("\nПосле добавления элемента %d в кучу\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Извлечение элемента с вершины кучи
        System.out.format("\nПосле удаления элемента %d с вершины кучи\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Инициализация кучи */
        // Инициализация минимальной кучи
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Инициализация максимальной кучи (достаточно изменить Comparator с помощью lambda-выражения)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nНиже приведен тестовый пример для max-heap");

        /* Добавление элемента в кучу */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Получение элемента с вершины кучи */
        int peek = maxHeap.peek();
        System.out.format("\nЭлемент на вершине кучи = %d\n", peek);

        /* Извлечение элемента с вершины кучи */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* Получение размера кучи */
        int size = maxHeap.size();
        System.out.format("\nКоличество элементов в куче = %d\n", size);

        /* Проверка, пуста ли куча */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nПуста ли куча: %b\n", isEmpty);

        /* Построить кучу по входному списку */
        // Временная сложность равна O(n), а не O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nПосле построения min-heap из входного списка");
        PrintUtil.printHeap(minHeap);
    }
}
