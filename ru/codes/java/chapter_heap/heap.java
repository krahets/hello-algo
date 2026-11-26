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
        heap.offer(val); // Вставить элемент в кучу
        System.out.format("\nПосле вставки элемента %d:\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Извлечь элемент из корня
        System.out.format("\nПосле извлечения элемента %d из корня:\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Инициализировать кучу */
        // Инициализировать мин-кучу
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Инициализировать макс-кучу, задав Comparator лямбда-выражением
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nВ этом примере используется макс-куча");

        /* Вставить элемент в кучу */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Получить элемент в корне */
        int peek = maxHeap.peek();
        System.out.format("\nЭлемент в корне: %d\n", peek);

        /* Извлечь элемент из корня */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* Размер кучи */
        int size = maxHeap.size();
        System.out.format("\nЧисло элементов в куче: %d\n", size);

        /* Проверить, пуста ли куча */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nПуста ли куча: %b\n", isEmpty);

        /* Построить кучу по входному списку */
        // Временная сложность — O(n), а не O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nМин-куча, построенная по входному списку:");
        PrintUtil.printHeap(minHeap);
    }
}
