/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Стек на основе связного списка */
typedef struct {
    ListNode *top; // Использовать головной узел как вершину стека
    int size;      // Длина стека
} LinkedListStack;

/* Конструктор */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* Деструктор */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* Получение длины стека */
int size(LinkedListStack *s) {
    return s->size;
}

/* Проверка, пуст ли стек */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* Поместить в стек */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Обновить поле указателя нового узла
    node->val = num;     // Обновить поле данных нового узла
    s->top = node;       // Обновить вершину стека
    s->size++;           // Обновить размер стека
}

/* Доступ к верхнему элементу стека */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("стек пуст\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* Извлечь из стека */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // Освободить память
    free(tmp);
    s->size--;
    return val;
}

/* Driver Code */
int main() {
    /* Инициализация стека */
    LinkedListStack *stack = newLinkedListStack();

    /* Помещение элемента в стек */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("Стек stack = ");
    printLinkedList(stack->top);

    /* Доступ к верхнему элементу стека */
    int val = peek(stack);
    printf("Верхний элемент стека top = %d\r\n", val);

    /* Извлечение элемента из стека */
    val = pop(stack);
    printf("Извлечен элемент из стека pop = %d, стек после извлечения =  ", val);
    printLinkedList(stack->top);

    /* Получение длины стека */
    printf("Длина стека size = %d\n", size(stack));

    /* Проверка на пустоту */
    bool empty = isEmpty(stack);
    printf("Пуст ли стек = %s\n", empty ? "true" : "false");

    // Освободить память
    delLinkedListStack(stack);

    return 0;
}
