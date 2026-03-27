/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Узел двусвязного списка */
typedef struct DoublyListNode {
    int val;                     // Значение узла
    struct DoublyListNode *next; // Узел-преемник
    struct DoublyListNode *prev; // Узел-предшественник
} DoublyListNode;

/* Конструктор */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* Деструктор */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* Двусторонняя очередь на основе двусвязного списка */
typedef struct {
    DoublyListNode *front, *rear; // Головной узел front, хвостовой узел rear
    int queSize;                  // Длина двусторонней очереди
} LinkedListDeque;

/* Конструктор */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* Деструктор */
void delLinkedListdeque(LinkedListDeque *deque) {
    // Освободить все узлы
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // Освободить структуру deque
    free(deque);
}

/* Получение длины очереди */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* Проверка, пуста ли очередь */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* Поместить в очередь */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // Если связный список пуст, пусть front и rear оба указывают на node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // Операция добавления в голову очереди
    else if (isFront) {
        // Добавить node в голову списка
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // Обновить головной узел
    }
    // Операция добавления в хвост очереди
    else {
        // Добавить node в хвост списка
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // Обновить длину очереди
}

/* Добавление в голову очереди */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* Добавление в хвост очереди */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* Доступ к элементу в начале очереди */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* Доступ к элементу в конце очереди */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* Извлечь из очереди */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // Операция извлечения из головы очереди
    if (isFront) {
        val = peekFirst(deque); // Временно сохранить значение головного узла
        DoublyListNode *fNext = deque->front->next;
        if (fNext) {
            fNext->prev = NULL;
            deque->front->next = NULL;
        }
        delDoublyListNode(deque->front);
        deque->front = fNext; // Обновить головной узел
    }
    // Операция извлечения из хвоста очереди
    else {
        val = peekLast(deque); // Временно сохранить значение хвостового узла
        DoublyListNode *rPrev = deque->rear->prev;
        if (rPrev) {
            rPrev->next = NULL;
            deque->rear->prev = NULL;
        }
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // Обновить хвостовой узел
    }
    deque->queSize--; // Обновить длину очереди
    return val;
}

/* Извлечение из головы очереди */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* Извлечение из хвоста очереди */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* Вывести очередь */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // Скопировать данные связного списка в массив
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* Driver Code */
int main() {
    /* Инициализация двусторонней очереди */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Дек deque = ");
    printLinkedListDeque(deque);

    /* Доступ к элементу */
    int peekFirstNum = peekFirst(deque);
    printf("Элемент в голове peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Элемент в хвосте peekLast = %d\r\n", peekLastNum);

    /* Добавление элемента в очередь */
    pushLast(deque, 4);
    printf("После вставки элемента 4 в хвост дек =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("После вставки элемента 1 в голову дек =");
    printLinkedListDeque(deque);

    /* Извлечение элемента из очереди */
    int popLastNum = popLast(deque);
    printf("Извлечен элемент из хвоста popLast = %d, дек после извлечения из хвоста = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("Извлечен элемент из головы popFirst = %d, дек после извлечения из головы = ", popFirstNum);
    printLinkedListDeque(deque);

    /* Получение длины очереди */
    int dequeSize = size(deque);
    printf("Длина дека size = %d\r\n", dequeSize);

    /* Проверка, пуста ли очередь */
    bool isEmpty = empty(deque);
    printf("Пуст ли дек = %s\r\n", isEmpty ? "true" : "false");

    // Освободить память
    delLinkedListdeque(deque);

    return 0;
}
