/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* Класс списка */
class MyList {
    private int[] arr; // Массив (для хранения элементов списка)
    private int capacity = 10; // Вместимость списка
    private int size = 0; // Длина списка (текущее число элементов)
    private int extendRatio = 2; // Коэффициент увеличения списка при каждом расширении

    /* Конструктор */
    public MyList() {
        arr = new int[capacity];
    }

    /* Получить длину списка (текущее число элементов) */
    public int size() {
        return size;
    }

    /* Получить вместимость списка */
    public int capacity() {
        return capacity;
    }

    /* Доступ к элементу */
    public int get(int index) {
        // Если индекс выходит за границы, выбрасывается исключение; далее аналогично
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("индекс выходит за границы");
        return arr[index];
    }

    /* Обновление элемента */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("индекс выходит за границы");
        arr[index] = num;
    }

    /* Добавление элемента в конец */
    public void add(int num) {
        // При превышении вместимости по числу элементов запускается расширение
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // Обновить число элементов
        size++;
    }

    /* Вставка элемента в середину */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("индекс выходит за границы");
        // При превышении вместимости по числу элементов запускается расширение
        if (size == capacity())
            extendCapacity();
        // Сдвинуть элемент с индексом index и все следующие элементы на одну позицию назад
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить число элементов
        size++;
    }

    /* Удаление элемента */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("индекс выходит за границы");
        int num = arr[index];
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить число элементов
        size--;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    public void extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // Обновить вместимость списка
        capacity = arr.length;
    }

    /* Преобразовать список в массив */
    public int[] toArray() {
        int size = size();
        // Преобразовывать только элементы списка в пределах фактической длины
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Driver Code */
    public static void main(String[] args) {
        /* Инициализация списка */
        MyList nums = new MyList();
        /* Добавление элемента в конец */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("Список nums = " + Arrays.toString(nums.toArray()) +
                ", вместимость = " + nums.capacity() + " , длина = " + nums.size());

        /* Вставка элемента в середину */
        nums.insert(3, 6);
        System.out.println("После вставки числа 6 по индексу 3 nums = " + Arrays.toString(nums.toArray()));

        /* Удаление элемента */
        nums.remove(3);
        System.out.println("После удаления элемента по индексу 3 nums = " + Arrays.toString(nums.toArray()));

        /* Доступ к элементу */
        int num = nums.get(1);
        System.out.println("Элемент по индексу 1: num = " + num);

        /* Обновление элемента */
        nums.set(1, 0);
        System.out.println("После обновления элемента по индексу 1 до 0 nums = " + Arrays.toString(nums.toArray()));

        /* Проверка механизма расширения */
        for (int i = 0; i < 10; i++) {
            // При i = 5 длина списка превысит его вместимость, и в этот момент сработает механизм расширения
            nums.add(i);
        }
        System.out.println("Список nums после увеличения вместимости = " + Arrays.toString(nums.toArray()) +
                ", вместимость = " + nums.capacity() + " , длина = " + nums.size());
    }
}
