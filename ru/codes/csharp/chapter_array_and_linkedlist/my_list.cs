/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* Класс списка */
class MyList {
    private int[] arr;           // Массив (хранит элементы списка)
    private int arrCapacity = 10;    // Вместимость списка
    private int arrSize = 0;         // Длина списка (текущее количество элементов)
    private readonly int extendRatio = 2;  // Коэффициент расширения списка при каждом увеличении

    /* Конструктор */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* Получить длину списка (текущее количество элементов) */
    public int Size() {
        return arrSize;
    }

    /* Получить вместимость списка */
    public int Capacity() {
        return arrCapacity;
    }

    /* Получить доступ к элементу */
    public int Get(int index) {
        // Если индекс выходит за границы, выбросить исключение; далее аналогично
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        return arr[index];
    }

    /* Обновить элемент */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        arr[index] = num;
    }

    /* Добавить элемент в конец */
    public void Add(int num) {
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Вставить элемент в середину */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Удалить элемент */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        int num = arr[index];
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить количество элементов
        arrSize--;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    public void ExtendCapacity() {
        // Создать новый массив длиной arrCapacity * extendRatio и скопировать в него исходный массив
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // Обновить вместимость списка
        arrCapacity = arr.Length;
    }

    /* Преобразовать список в массив */
    public int[] ToArray() {
        // Преобразовать только элементы списка в пределах действительной длины
        int[] arr = new int[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = Get(i);
        }
        return arr;
    }
}

public class my_list {
    [Test]
    public void Test() {
        /* Инициализировать список */
        MyList nums = new();
        /* Добавить элемент в конец */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("список nums =" + string.Join(",", nums.ToArray()) +
        ", вместимость =" + nums.Capacity() + ", длина =" + nums.Size());

        /* Вставить элемент в середину */
        nums.Insert(3, 6);
        Console.WriteLine("После вставки числа 6 по индексу 3 получаем nums = " + string.Join(",", nums.ToArray()));

        /* Удалить элемент */
        nums.Remove(3);
        Console.WriteLine("После удаления элемента по индексу 3 получаем nums =" + string.Join(",", nums.ToArray()));

        /* Получить доступ к элементу */
        int num = nums.Get(1);
        Console.WriteLine("обратиться киндекс 1 поэлемент, получаем num =" + num);

        /* Обновить элемент */
        nums.Set(1, 0);
        Console.WriteLine("После обновления элемента по индексу 1 на 0 получаем nums = " + string.Join(",", nums.ToArray()));

        /* Проверить механизм расширения */
        for (int i = 0; i < 10; i++) {
            // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
            nums.Add(i);
        }
        Console.WriteLine("Список nums после расширения =" + string.Join(",", nums.ToArray()) +
        ", вместимость =" + nums.Capacity() + ", длина =" + nums.Size());
    }
}
