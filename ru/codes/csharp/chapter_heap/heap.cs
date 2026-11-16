/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    [Test]
    public void Test() {
        // [region]{init}
        /* Инициализация кучи */
        // Инициализация минимальной кучи
        PriorityQueue<int, int> minHeap = new();
        // Инициализировать максимальную кучу (достаточно изменить Comparer с помощью lambda-выражения)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        // [endregion]{init}
        Console.WriteLine("Ниже приведен тестовый пример для max-heap");

        // [region]{push}
        /* Добавление элемента в кучу */
        maxHeap.Enqueue(1, 1);
        maxHeap.Enqueue(3, 3);
        maxHeap.Enqueue(2, 2);
        maxHeap.Enqueue(5, 5);
        maxHeap.Enqueue(4, 4);
        // [endregion]{push}
        PrintUtil.PrintHeap(maxHeap);

        // [region]{peek}
        /* Получение элемента с вершины кучи */
        int peek = maxHeap.Peek(); // 5
        // [endregion]{peek}
        Console.WriteLine($"Элемент на вершине кучи = {peek}");

        // [region]{pop_1}
        /* Извлечение элемента с вершины кучи */
        // Элементы, извлеченные из кучи, образуют последовательность от большего к меньшему
        peek = maxHeap.Dequeue(); // 5
        // [endregion]{pop_1}
        Console.WriteLine($"Извлеченный элемент = {peek}");
        // [region]{pop_2}
        peek = maxHeap.Dequeue(); // 4
        // [endregion]{pop_2}
        Console.WriteLine($"Извлеченный элемент = {peek}");
        // [region]{pop_3}
        peek = maxHeap.Dequeue(); // 3
        // [endregion]{pop_3}
        Console.WriteLine($"Извлеченный элемент = {peek}");
        // [region]{pop_4}
        peek = maxHeap.Dequeue(); // 2
        // [endregion]{pop_4}
        Console.WriteLine($"Извлеченный элемент = {peek}");
        // [region]{pop_5}
        peek = maxHeap.Dequeue(); // 1
        // [endregion]{pop_5}
        Console.WriteLine($"Извлеченный элемент = {peek}");

        // [region]{size}
        /* Получение размера кучи */
        int size = maxHeap.Count;
        // [endregion]{size}
        Console.WriteLine($"Количество элементов в куче = {size}");

        // [region]{is_empty}
        /* Проверка, пуста ли куча */
        bool isEmpty = maxHeap.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine($"Пуста ли куча: {isEmpty}");

        // [region]{heapify}
        /* Построить кучу по входному списку */
        // Временная сложность равна O(n), а не O(nlogn)
        minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
        // [endregion]{heapify}
        Console.WriteLine("После построения min-heap из входного списка");
        PrintUtil.PrintHeap(minHeap);
    }
}
