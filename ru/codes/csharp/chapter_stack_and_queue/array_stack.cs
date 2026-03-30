/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Стек на основе массива */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // Инициализация списка (динамического массива)
        stack = [];
    }

    /* Получение длины стека */
    public int Size() {
        return stack.Count;
    }

    /* Проверка, пуст ли стек */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Поместить в стек */
    public void Push(int num) {
        stack.Add(num);
    }

    /* Извлечь из стека */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* Доступ к верхнему элементу стека */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* Преобразовать List в Array и вернуть */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* Инициализация стека */
        ArrayStack stack = new();

        /* Помещение элемента в стек */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("Стек stack = " + string.Join(",", stack.ToArray()));

        /* Доступ к верхнему элементу стека */
        int peek = stack.Peek();
        Console.WriteLine("Верхний элемент peek = " + peek);

        /* Извлечение элемента из стека */
        int pop = stack.Pop();
        Console.WriteLine("Извлеченный элемент pop = " + pop + ", stack после извлечения = " + string.Join(",", stack.ToArray()));

        /* Получение длины стека */
        int size = stack.Size();
        Console.WriteLine("Длина стека size = " + size);

        /* Проверка на пустоту */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Пуст ли стек = " + isEmpty);
    }
}
