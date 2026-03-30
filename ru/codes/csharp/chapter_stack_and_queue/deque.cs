/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* Инициализация двусторонней очереди */
        // В C# связный список LinkedList рассматривается как двусторонняя очередь
        LinkedList<int> deque = new();

        /* Добавление элемента в очередь */
        deque.AddLast(2);   // Добавить в хвост очереди
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Добавить в голову очереди
        deque.AddFirst(1);
        Console.WriteLine("Двусторонняя очередь deque = " + string.Join(",", deque));

        /* Доступ к элементу */
        int? peekFirst = deque.First?.Value;  // Элемент в голове очереди
        Console.WriteLine("Первый элемент peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // Элемент в хвосте очереди
        Console.WriteLine("Последний элемент peekLast = " + peekLast);

        /* Извлечение элемента из очереди */
        deque.RemoveFirst();  // Извлечь элемент из головы очереди
        Console.WriteLine("После извлечения элемента из головы deque = " + string.Join(",", deque));
        deque.RemoveLast();   // Извлечь элемент из хвоста очереди
        Console.WriteLine("После извлечения элемента из хвоста deque = " + string.Join(",", deque));

        /* Получение длины двусторонней очереди */
        int size = deque.Count;
        Console.WriteLine("Длина двусторонней очереди size = " + size);

        /* Проверка, пуста ли двусторонняя очередь */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("Пуста ли двусторонняя очередь = " + isEmpty);
    }
}
