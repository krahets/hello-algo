/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* Класс списка */
class MyList {
    private int[] arr; // Массив (хранит элементы списка)
    private int capacity = 10; // Вместимость списка
    private int size = 0; // Длина списка (текущее количество элементов)
    private int extendRatio = 2; // Коэффициент расширения списка при каждом увеличении

    /* Конструктор */
    public MyList() {
        arr = new int[capacity];
    }

    /* Получить длину списка (текущее количество элементов) */
    public int size() {
        return size;
    }

    /* Получить вместимость списка */
    public int capacity() {
        return capacity;
    }

    /* Получить доступ к элементу */
    public int get(int index) {
        // Если индекс выходит за границы, выбросить исключение; далее аналогично
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс вне допустимого диапазона");
        return arr[index];
    }

    /* Обновить элемент */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс вне допустимого диапазона");
        arr[index] = num;
    }

    /* Добавить элемент в конец */
    public void add(int num) {
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // Обновить количество элементов
        size++;
    }

    /* Вставить элемент в середину */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс вне допустимого диапазона");
        // Если число элементов превышает вместимость, запустить механизм расширения
        if (size == capacity())
            extendCapacity();
        // Сдвинуть на одну позицию назад элемент с индексом index и все последующие элементы
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить количество элементов
        size++;
    }

    /* Удалить элемент */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс вне допустимого диапазона");
        int num = arr[index];
        // Сдвинуть на одну позицию вперед все элементы после индекса index
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить количество элементов
        size--;
        // Вернуть удаленный элемент
        return num;
    }

    /* Расширение списка */
    public void extendCapacity() {
        // Создать новый массив длиной в extendRatio раз больше исходного и скопировать в него исходный массив
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // ОбновитьВместимость списка
        capacity = arr.length;
    }

    /* Преобразовать список в массив */
    public int[] toArray() {
        int size = size();
        // Преобразовать только элементы списка в пределах действительной длины
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
        /* Инициализировать список */
        MyList nums = new MyList();
        /* Добавить элемент в конец */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("Список nums = " + Arrays.toString(nums.toArray()) +
                ", вместимость =" + nums.capacity() + ", длина =" + nums.size());

        /* Вставить элемент в середину */
        nums.insert(3, 6);
        System.out.println("После вставки числа 6 по индексу 3 получаем nums = " + Arrays.toString(nums.toArray()));

        /* Удалить элемент */
        nums.remove(3);
        System.out.println("После удаления элемента по индексу 3 получаем nums = " + Arrays.toString(nums.toArray()));

        /* Получить доступ к элементу */
        int num = nums.get(1);
        System.out.println("обратиться киндекс 1 поэлемент, получаем num =" + num);

        /* Обновить элемент */
        nums.set(1, 0);
        System.out.println("После обновления элемента по индексу 1 на 0 получаем nums = " + Arrays.toString(nums.toArray()));

        /* Проверить механизм расширения */
        for (int i = 0; i < 10; i++) {
            // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
            nums.add(i);
        }
        System.out.println("Список nums после расширения = " + Arrays.toString(nums.toArray()) +
                ", вместимость =" + nums.capacity() + ", длина =" + nums.size());
    }
}
