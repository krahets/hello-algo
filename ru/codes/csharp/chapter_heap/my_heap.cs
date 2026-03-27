/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* Максимальная куча */
class MaxHeap {
    // Использовать список вместо массива, чтобы не учитывать проблему расширения
    List<int> maxHeap;

    /* Конструктор, создающий пустую кучу */
    public MaxHeap() {
        maxHeap = [];
    }

    /* Конструктор: построить кучу по входному списку */
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

    /* Доступ к элементу на вершине кучи */
    public int Peek() {
        return maxHeap[0];
    }

    /* Добавление элемента в кучу */
    public void Push(int val) {
        // Добавление узла
        maxHeap.Add(val);
        // Просеивание снизу вверх
        SiftUp(Size() - 1);
    }

    /* Получение размера кучи */
    public int Size() {
        return maxHeap.Count;
    }

    /* Проверка, пуста ли куча */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    void SiftUp(int i) {
        while (true) {
            // Получение родительского узла для узла i
            int p = Parent(i);
            // Если «выход за пределы корневого узла» или «узел не требует исправления», завершить просеивание
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Поменять два узла местами
            Swap(i, p);
            // Циклическое просеивание вверх
            i = p;
        }
    }

    /* Извлечение элемента из кучи */
    public int Pop() {
        // Обработка пустого случая
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        Swap(0, Size() - 1);
        // Удаление узла
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // Просеивание сверху вниз
        SiftDown(0);
        // Вернуть элемент с вершины кучи
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
            // Если «узел i максимален» или «выход за пределы листовых узлов», завершить просеивание
            if (ma == i) break;
            // Поменять два узла местами
            Swap(i, ma);
            // Циклическое просеивание вниз
            i = ma;
        }
    }

    /* Поменять элементы местами */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* Вывести кучу (двоичное дерево) */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* Инициализация максимальной кучи */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nПосле построения кучи из входного списка");
        maxHeap.Print();

        /* Получение элемента с вершины кучи */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Элемент на вершине кучи = {peek}");

        /* Добавление элемента в кучу */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"После добавления элемента {val} в кучу");
        maxHeap.Print();

        /* Извлечение элемента с вершины кучи */
        peek = maxHeap.Pop();
        Console.WriteLine($"После извлечения элемента вершины кучи {peek}");
        maxHeap.Print();

        /* Получение размера кучи */
        int size = maxHeap.Size();
        Console.WriteLine($"Количество элементов в куче = {size}");

        /* Проверка, пуста ли куча */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"Пуста ли куча: {isEmpty}");
    }
}
