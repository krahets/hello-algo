/**
 * File: my_heap.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_heap;

/* Макс-куча */
class MaxHeap {
    // Список, в отличие от массива, расширяется автоматически
    List<int> maxHeap;

    /* Конструктор пустой кучи */
    public MaxHeap() {
        maxHeap = [];
    }

    /* Конструктор кучи по входному списку */
    public MaxHeap(IEnumerable<int> nums) {
        // Поместить элементы списка в кучу в прежнем порядке
        maxHeap = new List<int>(nums);
        // Выполнить просеивание для всех узлов, кроме листьев
        var size = Parent(this.Size() - 1);
        for (int i = size; i >= 0; i--) {
            SiftDown(i);
        }
    }

    /* Индекс левого ребёнка */
    int Left(int i) {
        return 2 * i + 1;
    }

    /* Индекс правого ребёнка */
    int Right(int i) {
        return 2 * i + 2;
    }

    /* Индекс родителя */
    int Parent(int i) {
        return (i - 1) / 2; // Целочисленное деление с округлением вниз
    }

    /* Посмотреть элемент в корне */
    public int Peek() {
        return maxHeap[0];
    }

    /* Вставить элемент в кучу */
    public void Push(int val) {
        // Добавить узел
        maxHeap.Add(val);
        // Просеивание вверх
        SiftUp(Size() - 1);
    }

    /* Размер кучи */
    public int Size() {
        return maxHeap.Count;
    }

    /* Проверить, пуста ли куча */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Просеивать вверх от узла i */
    void SiftUp(int i) {
        while (true) {
            // Найти родителя узла i
            int p = Parent(i);
            // Если вышли за корень или узел уже на своём месте, завершить просеивание
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // Поменять два узла местами
            Swap(i, p);
            // Продолжить просеивание вверх
            i = p;
        }
    }

    /* Извлечь элемент из кучи */
    public int Pop() {
        // Проверить, пуста ли куча
        if (IsEmpty())
            throw new IndexOutOfRangeException();
        // Поменять местами корень и крайний правый лист (первый и последний элементы)
        Swap(0, Size() - 1);
        // Удалить узел
        int val = maxHeap.Last();
        maxHeap.RemoveAt(Size() - 1);
        // Просеивание вниз
        SiftDown(0);
        // Вернуть элемент из корня
        return val;
    }

    /* Просеивать вниз от узла i */
    void SiftDown(int i) {
        while (true) {
            // Сохранить в ma индекс наибольшего из узлов i, l и r
            int l = Left(i), r = Right(i), ma = i;
            if (l < Size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < Size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // Если узел i наибольший или ниже нет детей, завершить просеивание
            if (ma == i) break;
            // Поменять два узла местами
            Swap(i, ma);
            // Продолжить просеивание вниз
            i = ma;
        }
    }

    /* Поменять элементы местами */
    void Swap(int i, int p) {
        (maxHeap[i], maxHeap[p]) = (maxHeap[p], maxHeap[i]);
    }

    /* Вывести кучу в виде бинарного дерева */
    public void Print() {
        var queue = new Queue<int>(maxHeap);
        PrintUtil.PrintHeap(queue);
    }
}

public class my_heap {
    [Test]
    public void Test() {
        /* Инициализировать макс-кучу */
        MaxHeap maxHeap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Console.WriteLine("\nКуча, построенная по входному списку:");
        maxHeap.Print();

        /* Получить элемент в корне */
        int peek = maxHeap.Peek();
        Console.WriteLine($"Элемент в корне: {peek}");

        /* Вставить элемент в кучу */
        int val = 7;
        maxHeap.Push(val);
        Console.WriteLine($"После вставки элемента {val}:");
        maxHeap.Print();

        /* Извлечь элемент из корня */
        peek = maxHeap.Pop();
        Console.WriteLine($"После извлечения элемента {peek} из корня:");
        maxHeap.Print();

        /* Размер кучи */
        int size = maxHeap.Size();
        Console.WriteLine($"Число элементов в куче: {size}");

        /* Проверить, пуста ли куча */
        bool isEmpty = maxHeap.IsEmpty();
        Console.WriteLine($"Пуста ли куча: {isEmpty}");
    }
}
