/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Очередь на основе циклического массива */
typedef struct {
    int *nums;       // Массив для хранения элементов очереди
    int front;       // Указатель front, указывающий на первый элемент очереди
    int queSize;     // Хвостовой указатель указывает на позицию хвоста + 1
    int queCapacity; // очередьвместимость
} ArrayQueue;

/* Конструктор */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // Инициализировать массив
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* Деструктор */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* Получить вместимость очереди */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* Получить длину очереди */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* Проверить, пуста ли очередь */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* Получить элемент в начале очереди */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* Поместить в очередь */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("очередьзаполнен\r\n");
        return;
    }
    // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
    // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Добавить num в конец очереди
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Извлечь из очереди */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* Вернуть массив для печати */
int *toArray(ArrayQueue *queue, int *queSize) {
    *queSize = queue->queSize;
    int *res = (int *)calloc(queue->queSize, sizeof(int));
    int j = queue->front;
    for (int i = 0; i < queue->queSize; i++) {
        res[i] = queue->nums[j % queue->queCapacity];
        j++;
    }
    return res;
}

/* Driver Code */
int main() {
    /* Инициализировать очередь */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* Поместить элемент в очередь */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Очередь queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* Получить элемент в начале очереди */
    int peekNum = peek(queue);
    printf("Элемент в голове очереди peek = %d\r\n", peekNum);

    /* Извлечь элемент из очереди */
    peekNum = pop(queue);
    printf("Извлеченный элемент pop = %d, после извлечения queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* Получить длину очереди */
    int queueSize = size(queue);
    printf("Длина очереди size = %d\r\n", queueSize);

    /* Проверить, пуста ли очередь */
    bool isEmpty = empty(queue);
    printf("Пуста ли очередь = %s\r\n", isEmpty ? "true" : "false");

    /* Проверить кольцевой массив */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("После %d-й итерации enqueue + dequeue queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // Освободить память
    delArrayQueue(queue);

    return 0;
}
