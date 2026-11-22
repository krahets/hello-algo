/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* Инициализация стека */
        Stack<int> stack = new();

        /* Помещение элемента в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // Обратите внимание: stack.ToArray() возвращает последовательность в обратном порядке, то есть индекс 0 соответствует вершине стека
        Console.WriteLine("Стек stack = " + string.Join(",", stack));

        /* Доступ к верхнему элементу стека */
        int peek = stack.Peek();
        Console.WriteLine("Верхний элемент peek = " + peek);

        /* Извлечение элемента из стека */
        int pop = stack.Pop();
        Console.WriteLine("Извлеченный элемент pop = " + pop + ", stack после извлечения = " + string.Join(",", stack));

        /* Получение длины стека */
        int size = stack.Count;
        Console.WriteLine("Длина стека size = " + size);

        /* Проверка на пустоту */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("Пуст ли стек = " + isEmpty);
    }
}
