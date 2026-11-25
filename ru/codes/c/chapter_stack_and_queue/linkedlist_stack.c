/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Стек на основе связного списка */
typedef struct {
    ListNode *top; // Первый узел списка служит вершиной стека
    int size;      // Размер стека
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

/* Получить размер стека */
int size(LinkedListStack *s) {
    return s->size;
}

/* Проверить, пуст ли стек */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* Поместить элемент в стек */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Записать в новый узел указатель на прежнюю вершину стека
    node->val = num;     // Записать значение в поле данных нового узла
    s->top = node;       // Обновить вершину стека
    s->size++;           // Обновить размер стека
}

/* Посмотреть элемент на вершине стека */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("Стек пуст\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* Снять элемент со стека */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // Освободить память
    free(tmp);
    s->size--;
    return val;
}

/* Пример использования */
int main() {
    /* Инициализировать стек */
    LinkedListStack *stack = newLinkedListStack();

    /* Поместить элементы в стек */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("Стек stack = ");
    printLinkedList(stack->top);

    /* Посмотреть элемент на вершине стека */
    int val = peek(stack);
    printf("Элемент на вершине стека top = %d\r\n", val);

    /* Снять элемент со стека */
    val = pop(stack);
    printf("Снятый элемент pop = %d, после снятия stack =  ", val);
    printLinkedList(stack->top);

    /* Получить размер стека */
    printf("Размер стека size = %d\n", size(stack));

    /* Проверить, пуст ли стек */
    bool empty = isEmpty(stack);
    printf("Стек пуст = %s\n", empty ? "true" : "false");

    // Освободить память
    delLinkedListStack(stack);

    return 0;
}
