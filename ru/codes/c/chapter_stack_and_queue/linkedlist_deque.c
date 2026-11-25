/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Узел двусвязного списка */
typedef struct DoublyListNode {
    int val;                     // Значение узла
    struct DoublyListNode *next; // Следующий узел
    struct DoublyListNode *prev; // Предыдущий узел
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

/* Двусторонняя очередь (дек) на основе двусвязного списка */
typedef struct {
    DoublyListNode *front, *rear; // front — первый узел, rear — последний
    int queSize;                  // Длина дека
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
    // Освободить память, занятую всеми узлами
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // Освободить память структуры deque
    free(deque);
}

/* Получить длину дека */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* Проверить, пуст ли дек */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* Добавить элемент в дек */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // Если связный список пуст, установить front и rear так, чтобы оба указателя указывали на node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // Добавить элемент в начало дека
    else if (isFront) {
        // Добавить node в начало связного списка
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // Обновить ссылку на первый узел
    }
    // Добавить элемент в конец дека
    else {
        // Добавить node в конец связного списка
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // Обновить длину дека
}

/* Добавить элемент в начало дека */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* Добавить элемент в конец дека */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* Посмотреть первый элемент дека */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* Посмотреть последний элемент дека */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* Извлечь элемент из дека */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
    if (deque->queSize == 1) {
        val = deque->front->val;
        delDoublyListNode(deque->front); // Оба указателя ссылаются на один узел, поэтому достаточно освободить его один раз
        deque->front = NULL;
        deque->rear = NULL;
    }
    // Извлечь элемент из начала дека
    else if (isFront) {
        val = peekFirst(deque); // Временно сохранить значение первого узла
        DoublyListNode *fNext = deque->front->next;
        fNext->prev = NULL;
        deque->front->next = NULL;
        delDoublyListNode(deque->front);
        deque->front = fNext; // Обновить ссылку на первый узел
    }
    // Извлечь элемент из конца дека
    else {
        val = peekLast(deque); // Временно сохранить значение последнего узла
        DoublyListNode *rPrev = deque->rear->prev;
        rPrev->next = NULL;
        deque->rear->prev = NULL;
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // Обновить ссылку на последний узел
    }
    deque->queSize--; // Обновить длину дека
    return val;
}

/* Извлечь элемент из начала дека */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* Извлечь элемент из конца дека */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* Вывести дек */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // Скопировать данные из связного списка в массив
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* Пример использования */
int main() {
    /* Инициализировать дек */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Дек deque = ");
    printLinkedListDeque(deque);

    /* Посмотреть первый и последний элементы */
    int peekFirstNum = peekFirst(deque);
    printf("Первый элемент дека peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Последний элемент дека peekLast = %d\r\n", peekLastNum);

    /* Добавить элементы в дек */
    pushLast(deque, 4);
    printf("После добавления 4 в конец дека deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("После добавления 1 в начало дека deque =");
    printLinkedListDeque(deque);

    /* Извлечь элементы из дека */
    int popLastNum = popLast(deque);
    printf("Извлечённый последний элемент popLast = %d, после извлечения deque = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("Извлечённый первый элемент popFirst = %d, после извлечения deque = ", popFirstNum);
    printLinkedListDeque(deque);

    /* Получить длину дека */
    int dequeSize = size(deque);
    printf("Длина дека size = %d\r\n", dequeSize);

    /* Проверить, пуст ли дек */
    bool isEmpty = empty(deque);
    printf("Дек пуст = %s\r\n", isEmpty ? "true" : "false");

    // Освободить память
    delLinkedListdeque(deque);

    return 0;
}
