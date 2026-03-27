/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* Инициализировать очередь */
        Queue<int> queue = new();

        /* Поместить элемент в очередь */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("Очередь queue = " + string.Join(",", queue));

        /* Получить элемент в начале очереди */
        int peek = queue.Peek();
        Console.WriteLine("голова очередиэлемент peek =" + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.Dequeue();
        Console.WriteLine("Элемент, извлеченный из очереди, pop = " + pop + ", queue после извлечения = " + string.Join(",", queue));

        /* Получить длину очереди */
        int size = queue.Count;
        Console.WriteLine("Длина очереди size =" + size);

        /* Проверить, пуста ли очередь */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("Очередь пуста: " + isEmpty);
    }
}
