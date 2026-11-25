/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Класс списка */
typedef struct {
    int *arr;        // Массив для хранения элементов списка
    int capacity;    // Ёмкость списка
    int size;        // Размер списка
    int extendRatio; // Коэффициент увеличения ёмкости списка
} MyList;

void extendCapacity(MyList *nums);

/* Конструктор */
MyList *newMyList() {
    MyList *nums = malloc(sizeof(MyList));
    nums->capacity = 10;
    nums->arr = malloc(sizeof(int) * nums->capacity);
    nums->size = 0;
    nums->extendRatio = 2;
    return nums;
}

/* Деструктор */
void delMyList(MyList *nums) {
    free(nums->arr);
    free(nums);
}

/* Получить длину списка */
int size(MyList *nums) {
    return nums->size;
}

/* Получить ёмкость списка */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* Доступ к элементу */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* Изменение элемента */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* Добавление элемента в конец */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Увеличение ёмкости
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* Вставка элемента в середину */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // Если для элементов не хватает места, увеличить ёмкость
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // Увеличение ёмкости
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* Удаление элемента */
// Имя remove уже используется в stdio.h
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* Увеличение ёмкости списка */
void extendCapacity(MyList *nums) {
    // Сначала выделить память
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // Скопировать данные в новую область памяти
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // Освободить прежнюю область памяти
    free(temp);

    // Перейти к новым данным
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* Преобразовать список в массив для вывода */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Демонстрационный код */
int main() {
    /* Инициализация списка */
    MyList *nums = newMyList();
    /* Добавление элемента в конец */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("Список nums = ");
    printArray(toArray(nums), size(nums));
    printf("Ёмкость = %d, длина = %d\n", capacity(nums), size(nums));

    /* Вставка элемента в середину */
    insert(nums, 3, 6);
    printf("После вставки числа 6 по индексу 3 nums = ");
    printArray(toArray(nums), size(nums));

    /* Удаление элемента */
    removeItem(nums, 3);
    printf("После удаления элемента по индексу 3 nums = ");
    printArray(toArray(nums), size(nums));

    /* Доступ к элементу */
    int num = get(nums, 1);
    printf("Элемент по индексу 1: num = %d\n", num);

    /* Изменение элемента */
    set(nums, 1, 0);
    printf("После записи 0 по индексу 1 nums = ");
    printArray(toArray(nums), size(nums));

    /* Проверка увеличения ёмкости */
    for (int i = 0; i < 10; i++) {
        // При i = 5 длина списка превысит его ёмкость, поэтому потребуется увеличить ёмкость
        add(nums, i);
    }

    printf("После увеличения ёмкости список nums = ");
    printArray(toArray(nums), size(nums));
    printf("Ёмкость = %d, длина = %d\n", capacity(nums), size(nums));

    /* Освободить выделенную память */
    delMyList(nums);

    return 0;
}
