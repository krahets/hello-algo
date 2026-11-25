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
    // Освободить память, занятую всеми узлами
    while (queue->front != NULL) {
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
    }
    // Освободить память структуры queue
    free(queue);
}

/* Получить длину очереди */
int size(LinkedListQueue *queue) {
    return queue->queSize;
}

/* Проверить, пуста ли очередь */
bool empty(LinkedListQueue *queue) {
    return (size(queue) == 0);
}

/* Добавить элемент в очередь */
void push(LinkedListQueue *queue, int num) {
    // Добавить node в конец списка
    ListNode *node = newListNode(num);
    // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
    if (queue->front == NULL) {
        queue->front = node;
        queue->rear = node;
    }
    // Если очередь непуста, добавить новый узел после последнего
    else {
        queue->rear->next = node;
        queue->rear = node;
    }
    queue->queSize++;
}

/* Посмотреть первый элемент очереди */
int peek(LinkedListQueue *queue) {
    assert(size(queue) && queue->front);
    return queue->front->val;
}

/* Извлечь элемент из очереди */
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
    // Скопировать данные из связного списка в массив
    int i;
    ListNode *node;
    for (i = 0, node = queue->front; i < queue->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, queue->queSize);
    free(arr);
}

/* Пример использования */
int main() {
    /* Инициализировать очередь */
    LinkedListQueue *queue = newLinkedListQueue();

    /* Добавить элементы в очередь */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Очередь queue = ");
    printLinkedListQueue(queue);

    /* Посмотреть первый элемент очереди */
    int peekNum = peek(queue);
    printf("Первый элемент очереди peek = %d\r\n", peekNum);

    /* Извлечь элемент из очереди */
    peekNum = pop(queue);
    printf("Извлечённый элемент pop = %d, после извлечения queue = ", peekNum);
    printLinkedListQueue(queue);

    /* Получить длину очереди */
    int queueSize = size(queue);
    printf("Длина очереди size = %d\r\n", queueSize);

    /* Проверить, пуста ли очередь */
    bool isEmpty = empty(queue);
    printf("Очередь пуста = %s\r\n", isEmpty ? "true" : "false");

    // Освободить память
    delLinkedListQueue(queue);

    return 0;
}
