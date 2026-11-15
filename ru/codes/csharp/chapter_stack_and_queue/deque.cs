/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        // [region]{init_deque}
        /* Инициализация двусторонней очереди */
        // В C# связный список LinkedList рассматривается как двусторонняя очередь
        LinkedList<int> deque = new();
        // [endregion]{init_deque}

        // [region]{push}
        /* Добавление элемента в очередь */
        deque.AddLast(2);   // Добавить в хвост очереди
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Добавить в голову очереди
        deque.AddFirst(1);
        // [endregion]{push}
        Console.WriteLine("Двусторонняя очередь deque = " + string.Join(",", deque));

        // [region]{peek_first}
        /* Доступ к элементу */
        int? peekFirst = deque.First?.Value;  // Элемент в голове очереди
        // [endregion]{peek_first}
        Console.WriteLine("Первый элемент peekFirst = " + peekFirst);
        // [region]{peek_last}
        int? peekLast = deque.Last?.Value;    // Элемент в хвосте очереди
        // [endregion]{peek_last}
        Console.WriteLine("Последний элемент peekLast = " + peekLast);

        // [region]{pop_first}
        /* Извлечение элемента из очереди */
        deque.RemoveFirst();  // Извлечь элемент из головы очереди
        // [endregion]{pop_first}
        Console.WriteLine("После извлечения элемента из головы deque = " + string.Join(",", deque));
        // [region]{pop_last}
        deque.RemoveLast();   // Извлечь элемент из хвоста очереди
        // [endregion]{pop_last}
        Console.WriteLine("После извлечения элемента из хвоста deque = " + string.Join(",", deque));

        // [region]{size}
        /* Получение длины двусторонней очереди */
        int size = deque.Count;
        // [endregion]{size}
        Console.WriteLine("Длина двусторонней очереди size = " + size);

        // [region]{is_empty}
        /* Проверка, пуста ли двусторонняя очередь */
        bool isEmpty = deque.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("Пуста ли двусторонняя очередь = " + isEmpty);
    }
}
