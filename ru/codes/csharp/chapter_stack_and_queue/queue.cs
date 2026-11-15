/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        // [region]{init_queue}
        /* Инициализация очереди */
        Queue<int> queue = new();
        // [endregion]{init_queue}

        // [region]{push}
        /* Добавление элемента в очередь */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        // [endregion]{push}
        Console.WriteLine("Очередь queue = " + string.Join(",", queue));

        // [region]{peek}
        /* Доступ к элементу в начале очереди */
        int peek = queue.Peek();
        // [endregion]{peek}
        Console.WriteLine("Первый элемент peek = " + peek);

        // [region]{pop}
        /* Извлечение элемента из очереди */
        int pop = queue.Dequeue();
        // [endregion]{pop}
        Console.WriteLine("Извлеченный элемент pop = " + pop + ", queue после извлечения = " + string.Join(",", queue));

        // [region]{size}
        /* Получение длины очереди */
        int size = queue.Count;
        // [endregion]{size}
        Console.WriteLine("Длина очереди size = " + size);

        // [region]{is_empty}
        /* Проверка, пуста ли очередь */
        bool isEmpty = queue.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("Пуста ли очередь = " + isEmpty);
    }
}
