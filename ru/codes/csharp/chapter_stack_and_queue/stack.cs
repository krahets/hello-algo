/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        // [region]{init_stack}
        /* Инициализация стека */
        Stack<int> stack = new();
        // [endregion]{init_stack}

        // [region]{push}
        /* Помещение элемента в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // Обратите внимание: stack.ToArray() возвращает последовательность в обратном порядке, то есть индекс 0 соответствует вершине стека
        // [endregion]{push}
        Console.WriteLine("Стек stack = " + string.Join(",", stack));

        // [region]{peek}
        /* Доступ к верхнему элементу стека */
        int peek = stack.Peek();
        // [endregion]{peek}
        Console.WriteLine("Верхний элемент peek = " + peek);

        // [region]{pop}
        /* Извлечение элемента из стека */
        int pop = stack.Pop();
        // [endregion]{pop}
        Console.WriteLine("Извлеченный элемент pop = " + pop + ", stack после извлечения = " + string.Join(",", stack));

        // [region]{size}
        /* Получение длины стека */
        int size = stack.Count;
        // [endregion]{size}
        Console.WriteLine("Длина стека size = " + size);

        // [region]{is_empty}
        /* Проверка на пустоту */
        bool isEmpty = stack.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("Пуст ли стек = " + isEmpty);
    }
}
