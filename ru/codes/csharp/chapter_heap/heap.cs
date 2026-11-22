/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // Добавление элемента в кучу
        Console.WriteLine($"\nПосле добавления элемента {val} в кучу\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // Извлечение элемента с вершины кучи
        Console.WriteLine($"\nПосле извлечения элемента вершины кучи {val}\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* Инициализация кучи */
        // Инициализация минимальной кучи
        PriorityQueue<int, int> minHeap = new();
        // Инициализировать максимальную кучу (достаточно изменить Comparer с помощью lambda-выражения)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("Ниже приведен тестовый пример для max-heap");

        /* Добавление элемента в кучу */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* Получение элемента с вершины кучи */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Элемент на вершине кучи = {peek}");

        /* Извлечение элемента с вершины кучи */
        // Элементы, извлеченные из кучи, образуют последовательность от большего к меньшему
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* Получение размера кучи */
        int size = maxHeap.Count;
        Console.WriteLine($"Количество элементов в куче = {size}");

        /* Проверка, пуста ли куча */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"Пуста ли куча: {isEmpty}");

        /* Построить кучу по входному списку */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("После построения min-heap из входного списка");
        PrintUtil.PrintHeap(minHeap);
    }
}
