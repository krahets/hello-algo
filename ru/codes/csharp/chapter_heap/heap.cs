/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // Вставить элемент в кучу
        Console.WriteLine($"\nПосле вставки элемента {val}:\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // Извлечь элемент из корня
        Console.WriteLine($"\nПосле извлечения элемента {val} из корня:\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* Инициализировать кучу */
        // Инициализировать мин-кучу
        PriorityQueue<int, int> minHeap = new();
        // Инициализировать макс-кучу, задав Comparer лямбда-выражением
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("В этом примере используется макс-куча");

        /* Вставить элемент в кучу */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* Получить элемент в корне */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Элемент в корне: {peek}");

        /* Извлечь элемент из корня */
        // При извлечении элементы образуют последовательность в порядке убывания
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* Размер кучи */
        int size = maxHeap.Count;
        Console.WriteLine($"Число элементов в куче: {size}");

        /* Проверить, пуста ли куча */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"Пуста ли куча: {isEmpty}");

        /* Построить кучу по входному списку */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("Мин-куча, построенная по входному списку:");
        PrintUtil.PrintHeap(minHeap);
    }
}
