/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void main(String[] args) {
        // [region]{init}
        /* Инициализация кучи */
        // Инициализация минимальной кучи
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Инициализация максимальной кучи (достаточно изменить Comparator с помощью lambda-выражения)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
        // [endregion]{init}

        System.out.println("\nНиже приведен тестовый пример для max-heap");

        // [region]{push}
        /* Добавление элемента в кучу */
        maxHeap.offer(1);
        maxHeap.offer(3);
        maxHeap.offer(2);
        maxHeap.offer(5);
        maxHeap.offer(4);
        // [endregion]{push}
        PrintUtil.printHeap(maxHeap);

        // [region]{peek}
        /* Получение элемента с вершины кучи */
        int peek = maxHeap.peek(); // 5
        // [endregion]{peek}
        System.out.format("\nЭлемент на вершине кучи = %d\n", peek);

        // [region]{pop_1}
        /* Извлечение элемента с вершины кучи */
        // Извлеченные элементы образуют последовательность по убыванию
        peek = maxHeap.poll(); // 5
        // [endregion]{pop_1}
        System.out.println(peek);
        // [region]{pop_2}
        peek = maxHeap.poll(); // 4
        // [endregion]{pop_2}
        System.out.println(peek);
        // [region]{pop_3}
        peek = maxHeap.poll(); // 3
        // [endregion]{pop_3}
        System.out.println(peek);
        // [region]{pop_4}
        peek = maxHeap.poll(); // 2
        // [endregion]{pop_4}
        System.out.println(peek);
        // [region]{pop_5}
        peek = maxHeap.poll(); // 1
        // [endregion]{pop_5}
        System.out.println(peek);

        // [region]{size}
        /* Получение размера кучи */
        int size = maxHeap.size();
        // [endregion]{size}
        System.out.format("\nКоличество элементов в куче = %d\n", size);

        // [region]{is_empty}
        /* Проверка, пуста ли куча */
        boolean isEmpty = maxHeap.isEmpty();
        // [endregion]{is_empty}
        System.out.format("\nПуста ли куча: %b\n", isEmpty);

        // [region]{heapify}
        /* Построить кучу по входному списку */
        // Временная сложность равна O(n), а не O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        // [endregion]{heapify}
        System.out.println("\nПосле построения min-heap из входного списка");
        PrintUtil.printHeap(minHeap);
    }
}
