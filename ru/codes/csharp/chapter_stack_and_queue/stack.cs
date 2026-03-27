/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* Инициализировать стек */
        Stack<int> stack = new();

        /* Поместить элемент в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // Обратите внимание: stack.ToArray() дает последовательность в обратном порядке, то есть индекс 0 соответствует вершине стека
        Console.WriteLine("Стек stack = " + string.Join(",", stack));

        /* Получить верхний элемент стека */
        int peek = stack.Peek();
        Console.WriteLine("вершина стекаэлемент peek =" + peek);

        /* Извлечь элемент из стека */
        int pop = stack.Pop();
        Console.WriteLine("Элемент, извлеченный из стека, pop = " + pop + ", stack после извлечения = " + string.Join(",", stack));

        /* Получить длину стека */
        int size = stack.Count;
        Console.WriteLine("Длина стека size =" + size);

        /* Проверить, пуста ли структура */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("стекпуст ли =" + isEmpty);
    }
}
