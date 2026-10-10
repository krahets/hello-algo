/**
 * File: linkedlist_queue.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Очередь на основе связного списка */
typedef struct {
    ListNode *front, *rear;
    int queSize;
} LinkedListQueue;

/* Конструктор */
LinkedListQueue *newLinkedListQueue() {
    LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
    queue->front = NULL;
    queue->rear = NULL;
    queue->queSize = 0;
    return queue;
}

/* Деструктор */
void delLinkedListQueue(LinkedListQueue *queue) {
    // Освободить все узлы
    while (queue->front != NULL) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // Освободить структуру queue
    free(queue);
}

/* Получение длины очереди */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* Проверка, пуста ли очередь */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* Поместить в очередь */
void push(LinkedListQueue *queue, int num) {
    // Добавить node в хвост
    ListNode *node = newListNode(num);
    // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // Если очередь не пуста, добавить этот узел после хвостового узла
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* Доступ к элементу в начале очереди */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* Извлечь из очереди */
int pop(LinkedListQueue *queue) {
    int num = peek(queue);
    ListNode *tmp = queue->front;
    queue->front = queue->front->next;
    free(tmp);
    queue->queSize--;
    return num;
}

/* Вывести очередь */
void printLinkedListQueue(LinkedListQueue *queue) {
    int *arr = malloc(sizeof(int) * queue->queSize);
    // Скопировать данные связного списка в массив
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* Driver Code */
int main() {
    /* Инициализация очереди */
    LinkedListQueue *queue = newLinkedListQueue();

    /* Добавление элемента в очередь */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Очередь queue = ");
    printLinkedListQueue(queue);

    /* Доступ к элементу в начале очереди */
    int peekNum = peek(queue);
    printf("Элемент в голове peek = %d\r\n", peekNum);

    /* Извлечение элемента из очереди */
    peekNum = pop(queue);
    printf("Извлечен элемент из очереди pop = %d, очередь после извлечения = ", peekNum);
    printLinkedListQueue(queue);

    /* Получение длины очереди */
    int queueSize = size(queue);
    printf("Длина очереди size = %d\r\n", queueSize);

    /* Проверка, пуста ли очередь */
    bool isEmpty = empty(queue);
    printf("Пуста ли очередь = %s\r\n", isEmpty ? "true" : "false");

    // Освободить память
    delLinkedListQueue(queue);

    return 0;
}
