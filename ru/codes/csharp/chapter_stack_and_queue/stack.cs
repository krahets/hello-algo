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

        /* Поместить элементы в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // Метод stack.ToArray() возвращает элементы в обратном порядке: элемент с индексом 0 находится на вершине стека
        Console.WriteLine("Стек stack = " + string.Join(",", stack));

        /* Посмотреть элемент на вершине стека */
        int peek = stack.Peek();
        Console.WriteLine("Элемент на вершине стека peek = " + peek);

        /* Снять элемент со стека */
        int pop = stack.Pop();
        Console.WriteLine("Снятый элемент pop = " + pop + ", после снятия stack = " + string.Join(",", stack));

        /* Получить размер стека */
        int size = stack.Count;
        Console.WriteLine("Размер стека size = " + size);

        /* Проверить, пуст ли стек */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("Стек пуст = " + isEmpty);
    }
}
