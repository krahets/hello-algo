/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* Инициализировать дек */
        // В C# в качестве дека используется связный список LinkedList
        LinkedList<int> deque = new();

        /* Добавить элементы в дек */
        deque.AddLast(2);   // Добавить в конец дека
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Добавить в начало дека
        deque.AddFirst(1);
        Console.WriteLine("Дек deque = " + string.Join(",", deque));

        /* Посмотреть первый и последний элементы */
        int? peekFirst = deque.First?.Value;  // Первый элемент дека
        Console.WriteLine("Первый элемент дека peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // Последний элемент дека
        Console.WriteLine("Последний элемент дека peekLast = " + peekLast);

        /* Извлечь элементы из дека */
        deque.RemoveFirst();  // Извлечь элемент из начала дека
        Console.WriteLine("После извлечения первого элемента deque = " + string.Join(",", deque));
        deque.RemoveLast();   // Извлечь элемент из конца дека
        Console.WriteLine("После извлечения последнего элемента deque = " + string.Join(",", deque));

        /* Получить длину дека */
        int size = deque.Count;
        Console.WriteLine("Длина дека size = " + size);

        /* Проверить, пуст ли дек */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("Дек пуст = " + isEmpty);
    }
}
