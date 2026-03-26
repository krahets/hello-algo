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
        Console.WriteLine("двусторонняя очередь deque =" + string.Join(",", deque));

        /* Получить доступ к элементу */
        int? peekFirst = deque.First?.Value;  // элемент в голове очереди
        Console.WriteLine("элемент в голове очереди peekFirst =" + peekFirst);
        int? peekLast = deque.Last?.Value;    // элемент в хвосте очереди
        Console.WriteLine("элемент в хвосте очереди peekLast =" + peekLast);

        /* Извлечь элемент из очереди */
        deque.RemoveFirst();  // голова очередиИзвлечь элемент из очереди
        Console.WriteLine("deque после извлечения элемента из головы =" + string.Join(",", deque));
        deque.RemoveLast();   // хвост очередиИзвлечь элемент из очереди
        Console.WriteLine("deque после извлечения элемента из хвоста =" + string.Join(",", deque));

        /* Получить длину двусторонней очереди */
        int size = deque.Count;
        Console.WriteLine("Длина двусторонней очереди size =" + size);

        /* Проверить, пуста ли двусторонняя очередь */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("двусторонняя очередьпуст ли =" + isEmpty);
    }
}
