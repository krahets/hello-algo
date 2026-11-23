/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* Инициализация очереди */
        Queue<int> queue = new();

        /* Добавление элемента в очередь */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("Очередь queue = " + string.Join(",", queue));

        /* Доступ к элементу в начале очереди */
        int peek = queue.Peek();
        Console.WriteLine("Первый элемент peek = " + peek);

        /* Извлечение элемента из очереди */
        int pop = queue.Dequeue();
        Console.WriteLine("Извлеченный элемент pop = " + pop + ", queue после извлечения = " + string.Join(",", queue));

        /* Получение длины очереди */
        int size = queue.Count;
        Console.WriteLine("Длина очереди size = " + size);

        /* Проверка, пуста ли очередь */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("Пуста ли очередь = " + isEmpty);
    }
}
