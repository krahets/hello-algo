/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* Инициализировать двустороннюю очередь */
        // В C# связный список LinkedList можно использовать как двустороннюю очередь
        LinkedList<int> deque = new();

        /* Поместить элемент в очередь */
        deque.AddLast(2);   // Добавить в хвост очереди
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Добавить в голову очереди
        deque.AddFirst(1);
        Console.WriteLine("Двусторонняя очередь deque = " + string.Join(",", deque));

        /* Получить доступ к элементу */
        int? peekFirst = deque.First?.Value;  // голова очередиэлемент
        Console.WriteLine("голова очередиэлемент peekFirst =" + peekFirst);
        int? peekLast = deque.Last?.Value;    // хвост очередиэлемент
        Console.WriteLine("хвост очередиэлемент peekLast =" + peekLast);

        /* Извлечь элемент из очереди */
        deque.RemoveFirst();  // голова очередиИзвлечь элемент из очереди
        Console.WriteLine("deque после извлечения из головы = " + string.Join(",", deque));
        deque.RemoveLast();   // хвост очередиИзвлечь элемент из очереди
        Console.WriteLine("deque после извлечения из хвоста = " + string.Join(",", deque));

        /* Получить длину двусторонней очереди */
        int size = deque.Count;
        Console.WriteLine("Длина двусторонней очереди size = " + size);

        /* Проверить, пуста ли двусторонняя очередь */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("Двусторонняя очередь пуста: " + isEmpty);
    }
}
