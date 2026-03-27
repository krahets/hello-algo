/**
 * File: my_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Класс списка */
typedef struct {
    int *arr;        // Массив (хранит элементы списка)
    int capacity;    // Вместимость списка
    int size;        // Размер списка
    int extendRatio; // Коэффициент расширения списка при каждом увеличении
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

/* Получитьсписокдлина */
int size(MyList *nums) {
    return nums->size;
}

/* Получить вместимость списка */
int capacity(MyList *nums) {
    return nums->capacity;
}

/* Получить доступ к элементу */
int get(MyList *nums, int index) {
    assert(index >= 0 && index < nums->size);
    return nums->arr[index];
}

/* Обновить элемент */
void set(MyList *nums, int index, int num) {
    assert(index >= 0 && index < nums->size);
    nums->arr[index] = num;
}

/* Добавить элемент в конец */
void add(MyList *nums, int num) {
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // расширение
    }
    nums->arr[size(nums)] = num;
    nums->size++;
}

/* Вставить элемент в середину */
void insert(MyList *nums, int index, int num) {
    assert(index >= 0 && index < size(nums));
    // Если число элементов превышает вместимость, запустить механизм расширения
    if (size(nums) == capacity(nums)) {
        extendCapacity(nums); // расширение
    }
    for (int i = size(nums); i > index; --i) {
        nums->arr[i] = nums->arr[i - 1];
    }
    nums->arr[index] = num;
    nums->size++;
}

/* Удалить элемент */
// Обратите внимание: stdio.h уже использует ключевое слово remove
int removeItem(MyList *nums, int index) {
    assert(index >= 0 && index < size(nums));
    int num = nums->arr[index];
    for (int i = index; i < size(nums) - 1; i++) {
        nums->arr[i] = nums->arr[i + 1];
    }
    nums->size--;
    return num;
}

/* Расширение списка */
void extendCapacity(MyList *nums) {
    // Сначала выделить память
    int newCapacity = capacity(nums) * nums->extendRatio;
    int *extend = (int *)malloc(sizeof(int) * newCapacity);
    int *temp = nums->arr;

    // Скопировать старые данные в новые данные
    for (int i = 0; i < size(nums); i++)
        extend[i] = nums->arr[i];

    // Освободить старые данные
    free(temp);

    // Обновить новые данные
    nums->arr = extend;
    nums->capacity = newCapacity;
}

/* Преобразовать список в Array для вывода */
int *toArray(MyList *nums) {
    return nums->arr;
}

/* Driver Code */
int main() {
    /* Инициализировать список */
    MyList *nums = newMyList();
    /* Добавить элемент в конец */
    add(nums, 1);
    add(nums, 3);
    add(nums, 2);
    add(nums, 5);
    add(nums, 4);
    printf("Список nums = ");
    printArray(toArray(nums), size(nums));
    printf("Вместимость = %d, длина = %d\n", capacity(nums), size(nums));

    /* Вставить элемент в середину */
    insert(nums, 3, 6);
    printf("После вставки числа 6 по индексу 3 получаем nums = ");
    printArray(toArray(nums), size(nums));

    /* Удалить элемент */
    removeItem(nums, 3);
    printf("После удаления элемента по индексу 3 получаем nums = ");
    printArray(toArray(nums), size(nums));

    /* Получить доступ к элементу */
    int num = get(nums, 1);
    printf("обратиться киндекс 1 поэлемент, получаем num = %d\n", num);

    /* Обновить элемент */
    set(nums, 1, 0);
    printf("После обновления элемента по индексу 1 на 0 получаем nums = ");
    printArray(toArray(nums), size(nums));

    /* Проверить механизм расширения */
    for (int i = 0; i < 10; i++) {
        // При i = 5 длина списка превысит его вместимость, и тогда сработает механизм расширения
        add(nums, i);
    }

    printf("Список nums после расширения = ");
    printArray(toArray(nums), size(nums));
    printf("Вместимость = %d, длина = %d\n", capacity(nums), size(nums));

    /* Освободить выделенную память */
    delMyList(nums);

    return 0;
}
