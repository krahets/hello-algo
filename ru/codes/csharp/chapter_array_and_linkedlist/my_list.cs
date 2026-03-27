/**
 * File: my_list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

/* Класс списка */
class MyList {
    private int[] arr;           // Массив (для хранения элементов списка)
    private int arrCapacity = 10;    // Вместимость списка
    private int arrSize = 0;         // Длина списка (текущее число элементов)
    private readonly int extendRatio = 2;  // Коэффициент увеличения списка при каждом расширении

    /* Конструктор */
    public MyList() {
        arr = new int[arrCapacity];
    }

    /* Получить длину списка (текущее число элементов) */
    public int Size() {
        return arrSize;
    }

    /* Получить вместимость списка */
    public int Capacity() {
        return arrCapacity;
    }

    /* Доступ к элементу */
    public int Get(int index) {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        return arr[index];
    }

    /* Обновление элемента */
    public void Set(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        arr[index] = num;
    }

    /* Добавление элемента в конец */
    public void Add(int num) {
        // При превышении вместимости по числу элементов запускается расширение
        if (arrSize == arrCapacity)
            ExtendCapacity();
        arr[arrSize] = num;
        // Обновить число элементов
        arrSize++;
    }

    /* Вставка элемента в середину */
    public void Insert(int index, int num) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        // При превышении вместимости по числу элементов запускается расширение
        if (arrSize == arrCapacity)
            ExtendCapacity();
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for (int j = arrSize - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить число элементов
        arrSize++;
    }

    /* Удаление элемента */
    public int Remove(int index) {
        if (index < 0 || index >= arrSize)
            throw new IndexOutOfRangeException("индекс выходит за границы");
        int num = arr[index];
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int j = index; j < arrSize - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить число элементов
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
        // Преобразовывать только элементы списка в пределах фактической длины
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
                           ", вместимость = " + nums.Capacity() + " , длина = " + nums.Size());

        /* Вставка элемента в середину */
        nums.Insert(3, 6);
        Console.WriteLine("После вставки числа 6 по индексу 3 nums = " + string.Join(",", nums.ToArray()));

        /* Удаление элемента */
        nums.Remove(3);
        Console.WriteLine("После удаления элемента по индексу 3 nums = " + string.Join(",", nums.ToArray()));

        /* Доступ к элементу */
        int num = nums.Get(1);
        Console.WriteLine("Элемент по индексу 1: num = " + num);

        /* Обновление элемента */
        nums.Set(1, 0);
        Console.WriteLine("После обновления элемента по индексу 1 до 0 nums = " + string.Join(",", nums.ToArray()));

        /* Проверка механизма расширения */
        for (int i = 0; i < 10; i++) {
            // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
            nums.Add(i);
        }
        Console.WriteLine("Список nums после увеличения вместимости = " + string.Join(",", nums.ToArray()) +
                           ", вместимость = " + nums.Capacity() + " , длина = " + nums.Size());
    }
}
