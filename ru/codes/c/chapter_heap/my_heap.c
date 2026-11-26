/**
 * File: my_heap.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Макс-куча */
typedef struct {
    // size — фактическое число элементов
    int size;
    // Заранее выделить память под массив, чтобы его не пришлось расширять
    int data[MAX_SIZE];
} MaxHeap;

// Объявления функций
void siftDown(MaxHeap *maxHeap, int i);
void siftUp(MaxHeap *maxHeap, int i);
int parent(MaxHeap *maxHeap, int i);

/* Конструктор кучи по срезу */
MaxHeap *newMaxHeap(int nums[], int size) {
    // Добавить все элементы в кучу
    MaxHeap *maxHeap = (MaxHeap *)malloc(sizeof(MaxHeap));
    maxHeap->size = size;
    memcpy(maxHeap->data, nums, size * sizeof(int));
    for (int i = parent(maxHeap, size - 1); i >= 0; i--) {
        // Выполнить просеивание для всех узлов, кроме листьев
        siftDown(maxHeap, i);
    }
    return maxHeap;
}

/* Деструктор */
void delMaxHeap(MaxHeap *maxHeap) {
    // Освободить память
    free(maxHeap);
}

/* Индекс левого ребёнка */
int left(MaxHeap *maxHeap, int i) {
    return 2 * i + 1;
}

/* Индекс правого ребёнка */
int right(MaxHeap *maxHeap, int i) {
    return 2 * i + 2;
}

/* Индекс родителя */
int parent(MaxHeap *maxHeap, int i) {
    return (i - 1) / 2; // Округление вниз
}

/* Поменять элементы местами */
void swap(MaxHeap *maxHeap, int i, int j) {
    int temp = maxHeap->data[i];
    maxHeap->data[i] = maxHeap->data[j];
    maxHeap->data[j] = temp;
}

/* Размер кучи */
int size(MaxHeap *maxHeap) {
    return maxHeap->size;
}

/* Проверить, пуста ли куча */
int isEmpty(MaxHeap *maxHeap) {
    return maxHeap->size == 0;
}

/* Посмотреть элемент в корне */
int peek(MaxHeap *maxHeap) {
    return maxHeap->data[0];
}

/* Вставить элемент в кучу */
void push(MaxHeap *maxHeap, int val) {
    // При стандартных настройках столько узлов добавлять не следует
    if (maxHeap->size == MAX_SIZE) {
        printf("heap is full!");
        return;
    }
    // Добавить узел
    maxHeap->data[maxHeap->size] = val;
    maxHeap->size++;

    // Просеивание вверх
    siftUp(maxHeap, maxHeap->size - 1);
}

/* Извлечь элемент из кучи */
int pop(MaxHeap *maxHeap) {
    // Проверить, пуста ли куча
    if (isEmpty(maxHeap)) {
        printf("heap is empty!");
        return INT_MAX;
    }
    // Поменять местами корень и крайний правый лист (первый и последний элементы)
    swap(maxHeap, 0, size(maxHeap) - 1);
    // Удалить узел
    int val = maxHeap->data[maxHeap->size - 1];
    maxHeap->size--;
    // Просеивание вниз
    siftDown(maxHeap, 0);

    // Вернуть элемент из корня
    return val;
}

/* Просеивать вниз от узла i */
void siftDown(MaxHeap *maxHeap, int i) {
    while (true) {
        // Сохранить в max индекс наибольшего из узлов i, l и r
        int l = left(maxHeap, i);
        int r = right(maxHeap, i);
        int max = i;
        if (l < size(maxHeap) && maxHeap->data[l] > maxHeap->data[max]) {
            max = l;
        }
        if (r < size(maxHeap) && maxHeap->data[r] > maxHeap->data[max]) {
            max = r;
        }
        // Если ни у одного потомка значение не больше, чем у родителя, завершить просеивание
        if (max == i) {
            break;
        }
        // Поменять два узла местами
        swap(maxHeap, i, max);
        // Продолжить просеивание вниз
        i = max;
    }
}

/* Просеивать вверх от узла i */
void siftUp(MaxHeap *maxHeap, int i) {
    while (true) {
        // Найти родителя узла i
        int p = parent(maxHeap, i);
        // Если вышли за корень или узел уже на своём месте, завершить просеивание
        if (p < 0 || maxHeap->data[i] <= maxHeap->data[p]) {
            break;
        }
        // Поменять два узла местами
        swap(maxHeap, i, p);
        // Продолжить просеивание вверх
        i = p;
    }
}
