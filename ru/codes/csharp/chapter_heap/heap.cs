/**
 * File: heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

public class heap {
    void TestPush(PriorityQueue<int, int> heap, int val) {
        heap.Enqueue(val, val); // Добавить элемент в кучу
        Console.WriteLine($"\nЭлемент {val} после добавления в кучу\n");
        PrintUtil.PrintHeap(heap);
    }

    void TestPop(PriorityQueue<int, int> heap) {
        int val = heap.Dequeue(); // Извлечь верхний элемент из кучи
        Console.WriteLine($"\nвершина кучиЭлемент {val} после извлечения из кучи\n");
        PrintUtil.PrintHeap(heap);
    }

    [Test]
    public void Test() {
        /* Инициализироватькуча */
        // Инициализировать min-кучу
        PriorityQueue<int, int> minHeap = new();
        // Инициализировать max-кучу (достаточно изменить Comparer с помощью lambda-выражения)
        PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));
        Console.WriteLine("Ниже приведены тестовые примеры max-кучи");

        /* Добавить элемент в кучу */
        TestPush(maxHeap, 1);
        TestPush(maxHeap, 3);
        TestPush(maxHeap, 2);
        TestPush(maxHeap, 5);
        TestPush(maxHeap, 4);

        /* Получить верхний элемент кучи */
        int peek = maxHeap.Peek();
        Console.WriteLine($"вершина кучиэлементравно {peek}");

        /* Извлечь верхний элемент из кучи */
        // Извлеченные из кучи элементы образуют последовательность от большего к меньшему
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);
        TestPop(maxHeap);

        /* Получить размер кучи */
        int size = maxHeap.Count;
        Console.WriteLine($"Количество элементов в куче равно {size}");

        /* Проверить, пуста ли куча */
        bool isEmpty = maxHeap.Count == 0;
        Console.WriteLine($"кучапуст ли {isEmpty}");

        /* Входсписокипостроение кучи */
        var list = new int[] { 1, 3, 2, 5, 4 };
        minHeap = new PriorityQueue<int, int>(list.Select(x => (x, x)));
        Console.WriteLine("Входсписокипостроитьmin-кучапосле");
        PrintUtil.PrintHeap(minHeap);
    }
}
