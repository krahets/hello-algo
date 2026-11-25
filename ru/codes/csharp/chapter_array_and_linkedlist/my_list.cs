/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* Класс списка */
class MyList {
    private int[] arr;           // Массив для хранения элементов списка
    private int arrCapacity = 10;    // Ёмкость списка
    private int arrSize = 0;         // Длина списка (текущее количество элементов)
    private readonly int extendRatio = 2;  // Коэффициент увеличения ёмкости списка

    /* Конструктор */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* Получить длину списка (текущее количество элементов)*/
    public int Size() {
        return arrSize;
    }

    /* Получить ёмкость списка */
    public int Capacity() {
        return arrCapacity;
    }

    /* Доступ к элементу */
    public int Get(int index) {
        // При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Индекс за пределами списка");
        return arr[index];
    }

    /* Изменение элемента */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Индекс за пределами списка");
        arr[index] = num;
    }

    /* Добавление элемента в конец */
    public void Add(int num) {
        // Если для элементов не хватает места, увеличить ёмкость
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Вставка элемента в середину */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Индекс за пределами списка");
        // Если для элементов не хватает места, увеличить ёмкость
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить количество элементов
        arrSize++;
    }

    /* Удаление элемента */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("Индекс за пределами списка");
        int num = arr[index];
        // Сдвинуть все элементы после index на одну позицию влево
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить количество элементов
        arrSize--;
        // Вернуть удалённый элемент
        return num;
    }

    /* Увеличение ёмкости списка */
    public void ExtendCapacity() {
        // Создать массив длины arrCapacity * extendRatio и скопировать в него исходный массив
        Array.Resize(ref arr, arrCapacity * extendRatio);
        // Обновить ёмкость списка
        arrCapacity = arr.Length;
    }

    /* Преобразовать список в массив */
    public int[] ToArray() {
        // Преобразовать только используемую часть списка
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
        /* Инициализация списка */
        MyList nums = new();
        /* Добавление элемента в конец */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("Список nums = " + string.Join(",", nums.ToArray()) +
                           " | ёмкость = " + nums.Capacity() + " | длина = " + nums.Size());

        /* Вставка элемента в середину */
        nums.Insert(3, 6);
        Console.WriteLine("После вставки числа 6 по индексу 3 nums = " + string.Join(",", nums.ToArray()));

        /* Удаление элемента */
        nums.Remove(3);
        Console.WriteLine("После удаления элемента по индексу 3 nums = " + string.Join(",", nums.ToArray()));

        /* Доступ к элементу */
        int num = nums.Get(1);
        Console.WriteLine("Элемент по индексу 1: num = " + num);

        /* Изменение элемента */
        nums.Set(1, 0);
        Console.WriteLine("После записи 0 по индексу 1 nums = " + string.Join(",", nums.ToArray()));

        /* Проверка увеличения ёмкости */
        for (int i = 0; i < 10; i++) {
            // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
            nums.Add(i);
        }
        Console.WriteLine("После увеличения ёмкости список nums = " + string.Join(",", nums.ToArray()) +
                           " | ёмкость = " + nums.Capacity() + " | длина = " + nums.Size());
    }
}
