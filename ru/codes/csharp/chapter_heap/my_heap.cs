/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* Max-куча */
class MaxHeap {
    // Использовать список вместо массива, чтобы не учитывать проблему расширения
    List<int> maxHeap;

    /* Конструктор, построитьпустойкуча */
    public MaxHeap() {
        maxHeap = [];
    }

    /* Конструктор, строящий кучу по входному списку */
    public MaxHeap(IEnumerable<int> nums) {
        // Добавить элементы списка в кучу без изменений
        maxHeap = new List<int>(nums);
        // Выполнить heapify для всех узлов, кроме листовых
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* Получить индекс левого дочернего узла */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла */
    int Parent(int i) {
        return (i - 1) / 2; // Округление вниз при делении
    }

    /* Обратиться к элементу на вершине кучи */
    public int Peek() {
        return maxHeap[0];
    }

    /* Добавить элемент в кучу */
    public void Push(int val) {
        // Добавить узел
        maxHeap.Add(val);
        // Выполнить heapify снизу вверх
        SiftUp(Size() - 1);
    }

    /* Получить размер кучи */
    public int Size() {
        return maxHeap.Count;
    }

    /* Проверить, пуста ли куча */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    void SiftUp(int i) {
        while (true) {
            // Получить родительский узел для узла i
            int p = Parent(i);
            // Если «вышли за корневой узел» или «узел не требует восстановления», завершить просеивание
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Поменять местами два узла
            Swap(i, p);
            // Циклически выполнять просеивание вверх
            i = p;
        }
    }

    /* Извлечение элемента из кучи */
    public int Pop() {
        // Обработка пустого случая
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        Swap(0, Size() - 1);
        // Удалить узел
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // Выполнить heapify сверху вниз
        SiftDown(0);
        // Вернуть элемент на вершине кучи
        return val;
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    void SiftDown(int i) {
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Если «узел i максимален» или «достигнут листовой узел», завершить просеивание
            if (ma == i) break;
            // Поменять местами два узла
            Swap(i, ma);
            // Циклически выполнять просеивание вниз
            i = ma;
        }
    }

    /* Поменять элементы местами */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* Вывести кучу (в виде двоичного дерева) */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* Инициализировать max-кучу */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nВходной список и построение кучипосле");
        maxHeap.Print();

        /* Получить верхний элемент кучи */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Элемент на вершине кучи равен {peek}");

        /* Добавить элемент в кучу */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"После добавления элемента {val} в кучу");
        maxHeap.Print();

        /* Извлечь верхний элемент из кучи */
        peek = maxHeap.Pop();
        Console.WriteLine($"После извлечения верхнего элемента {peek} из кучи");
        maxHeap.Print();

        /* Получить размер кучи */
        int size = maxHeap.Size();
        Console.WriteLine($"Количество элементов в куче равно {size}");

        /* Проверить, пуста ли куча */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"Куча пуста: {isEmpty}");
    }
}
