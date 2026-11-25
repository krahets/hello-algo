/**
 * File: my_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

/* Класс списка */
class MyList {
    private int[] arr; // Массив для хранения элементов списка
    private int capacity = 10; // Ёмкость списка
    private int size = 0; // Длина списка (текущее количество элементов)
    private int extendRatio = 2; // Коэффициент увеличения ёмкости списка

    /* Конструктор */
    public MyList() {
        arr = new int[capacity];
    }

    /* Получить длину списка (текущее количество элементов) */
    public int size() {
        return size;
    }

    /* Получить ёмкость списка */
    public int capacity() {
        return capacity;
    }

    /* Доступ к элементу */
    public int get(int index) {
        // При выходе индекса за границы выбросить исключение. То же правило действует ниже
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс за пределами списка");
        return arr[index];
    }

    /* Изменение элемента */
    public void set(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс за пределами списка");
        arr[index] = num;
    }

    /* Добавление элемента в конец */
    public void add(int num) {
        // Если для элементов не хватает места, увеличить ёмкость
        if (size == capacity())
            extendCapacity();
        arr[size] = num;
        // Обновить количество элементов
        size++;
    }

    /* Вставка элемента в середину */
    public void insert(int index, int num) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс за пределами списка");
        // Если для элементов не хватает места, увеличить ёмкость
        if (size == capacity())
            extendCapacity();
        // Сдвинуть все элементы начиная с index на одну позицию вправо
        for (int j = size - 1; j >= index; j--) {
            arr[j + 1] = arr[j];
        }
        arr[index] = num;
        // Обновить количество элементов
        size++;
    }

    /* Удаление элемента */
    public int remove(int index) {
        if (index < 0 || index >= size)
            throw new IndexOutOfBoundsException("Индекс за пределами списка");
        int num = arr[index];
        // Сдвинуть все элементы после index на одну позицию влево
        for (int j = index; j < size - 1; j++) {
            arr[j] = arr[j + 1];
        }
        // Обновить количество элементов
        size--;
        // Вернуть удалённый элемент
        return num;
    }

    /* Увеличение ёмкости списка */
    public void extendCapacity() {
        // Создать массив в extendRatio раз длиннее исходного и скопировать в него исходный массив
        arr = Arrays.copyOf(arr, capacity() * extendRatio);
        // Обновить ёмкость списка
        capacity = arr.length;
    }

    /* Преобразовать список в массив */
    public int[] toArray() {
        int size = size();
        // Преобразовать только используемую часть списка
        int[] arr = new int[size];
        for (int i = 0; i < size; i++) {
            arr[i] = get(i);
        }
        return arr;
    }
}

public class my_list {
    /* Демонстрационный код */
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
                " | ёмкость = " + nums.capacity() + " | длина = " + nums.size());

        /* Вставка элемента в середину */
        nums.insert(3, 6);
        System.out.println("После вставки числа 6 по индексу 3 nums = " + Arrays.toString(nums.toArray()));

        /* Удаление элемента */
        nums.remove(3);
        System.out.println("После удаления элемента по индексу 3 nums = " + Arrays.toString(nums.toArray()));

        /* Доступ к элементу */
        int num = nums.get(1);
        System.out.println("Элемент по индексу 1: num = " + num);

        /* Изменение элемента */
        nums.set(1, 0);
        System.out.println("После записи 0 по индексу 1 nums = " + Arrays.toString(nums.toArray()));

        /* Проверка увеличения ёмкости */
        for (int i = 0; i < 10; i++) {
            // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
            nums.add(i);
        }
        System.out.println("После увеличения ёмкости список nums = " + Arrays.toString(nums.toArray()) +
                " | ёмкость = " + nums.capacity() + " | длина = " + nums.size());
    }
}
