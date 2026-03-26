/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Двусторонняя очередь на основе циклического массива */
typedef struct {
    int *nums;       // Массив для хранения элементов очереди
    int front;       // Указатель front, указывающий на первый элемент очереди
    int queSize;     // Хвостовой указатель указывает на позицию хвоста + 1
    int queCapacity; // вместимость очереди
} ArrayDeque;

/* Конструктор */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // Инициализировать массив
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* Деструктор */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* Получить вместимость двусторонней очереди */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* Получить длину двусторонней очереди */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* Проверить, пуста ли двусторонняя очередь */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* Вычислить индекс циклического массива */
int dequeIndex(ArrayDeque *deque, int i) {
    // С помощью операции взятия по модулю соединить начало и конец массива
    // Когда i выходит за конец массива, вернуться к началу
    // Когда i выходит за начало массива, вернуться к концу
    return ((i + capacity(deque)) % capacity(deque));
}

/* Поместить в голову очереди */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Двусторонняя очередь заполнена\r\n");
        return;
    }
    // Указатель головы очереди сдвигается на одну позицию влево
    // С помощью операции взятия по модулю front после выхода за начало массива возвращается к его концу
    deque->front = dequeIndex(deque, deque->front - 1);
    // Добавить num в голову очереди
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Поместить в хвост очереди */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Двусторонняя очередь заполнена\r\n");
        return;
    }
    // Вычислить указатель хвоста, указывающий на индекс за последним элементом
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Добавить num в конец очереди
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Получить элемент в начале очереди */
int peekFirst(ArrayDeque *deque) {
    // Ошибка доступа: двусторонняя очередь пуста
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Обратиться к элементу в хвосте очереди */
int peekLast(ArrayDeque *deque) {
    // Ошибка доступа: двусторонняя очередь пуста
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Извлечь из головы очереди */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Указатель головы очереди сдвигается на одну позицию вперед
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Извлечь из хвоста очереди */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* Вернуть массив для печати */
int *toArray(ArrayDeque *deque, int *queSize) {
    *queSize = deque->queSize;
    int *res = (int *)calloc(deque->queSize, sizeof(int));
    int j = deque->front;
    for (int i = 0; i < deque->queSize; i++) {
        res[i] = deque->nums[j % deque->queCapacity];
        j++;
    }
    return res;
}

/* Driver Code */
int main() {
    /* Инициализировать очередь */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Двусторонняя очередь deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Получить доступ к элементу */
    int peekFirstNum = peekFirst(deque);
    printf("Первый элемент дека peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("элемент в хвосте очереди peekLast = %d\r\n", peekLastNum);

    /* Поместить элемент в очередь */
    pushLast(deque, 4);
    printf("После добавления элемента 4 в хвост deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("После добавления элемента 1 в голову deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Извлечь элемент из очереди */
    int popLastNum = popLast(deque);
    printf("Элемент, извлеченный из хвоста очереди, = %d, deque после извлечения из хвоста =", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("Элемент, извлеченный из головы очереди, = %d, deque после извлечения из головы =", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* Получить длину очереди */
    int dequeSize = size(deque);
    printf("Длина двусторонней очереди size = %d\r\n", dequeSize);

    /* Проверить, пуста ли очередь */
    bool isEmpty = empty(deque);
    printf("Пуста ли очередь = %s\r\n", isEmpty ? "true" : "false");

    // Освободить память
    delArrayDeque(deque);

    return 0;
}
