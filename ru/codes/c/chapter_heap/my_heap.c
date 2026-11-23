/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Максимальная куча */
typedef struct {
    // size обозначает фактическое число элементов
    int size;
    // Использовать массив с заранее выделенной памятью, чтобы избежать расширения
    int data[MAX_SIZE];
} MaxHeap;

// Объявление функции
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* Конструктор, строящий кучу по срезу */
MaxHeap *newMaxHeap(int nums[], int size) {
    // Поместить все элементы в кучу
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // Выполнить heapify для всех узлов, кроме листовых
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* Деструктор */
void delMaxHeap(MaxHeap *maxHeap) {
    // Освободить память
    free(maxHeap);
}

/* Получить индекс левого дочернего узла */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* Получить индекс правого дочернего узла */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* Получить индекс родительского узла */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // Округление вниз
}

/* Поменять элементы местами */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* Получение размера кучи */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* Проверка, пуста ли куча */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* Доступ к элементу на вершине кучи */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* Добавление элемента в кучу */
void push(MaxHeap *maxHeap, int val) {
    // По умолчанию не следует добавлять так много узлов
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // Добавление узла
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // Просеивание снизу вверх
    siftUp(maxHeap, maxHeap->size - 1);
}

/* Извлечение элемента из кучи */
int pop(MaxHeap *maxHeap) {
    // Обработка пустого случая
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
    swap(maxHeap, 0, size(maxHeap) - 1);
    // Удаление узла
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // Просеивание сверху вниз
    siftDown(maxHeap, 0);

    // Вернуть элемент с вершины кучи
    return val;
}

/* Начиная с узла i, выполнить просеивание сверху вниз */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // Определить узел с максимальным значением среди i, l и r и обозначить его как max
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
        if (max == i) {
            break;
        }
        // Поменять два узла местами
        swap(maxHeap, i, max);
        // Циклическое просеивание вниз
        i = max;
    }
}

/* Начиная с узла i, выполнить просеивание снизу вверх */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // Получение родительского узла для узла i
        int p = parent(maxHeap, i);
        // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // Поменять два узла местами
        swap(maxHeap, i, p);
        // Циклическое просеивание вверх
        i = p;
    }
}
