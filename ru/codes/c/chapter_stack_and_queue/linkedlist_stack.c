/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Стек на основе связного списка */
typedef struct {
    ListNode *top; // Считать головной узел вершиной стека
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

/* Получить длину стека */
int size(LinkedListStack *s) {
    return s->size;
}

/* Проверить, пуст ли стек */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* Поместить в стек */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Обновить поле указателя нового узла
    node->val = num;     // Обновить поле данных нового узла
    s->top = node;       // Обновитьвершина стека
    s->size++;           // Обновить размер стека
}

/* Получить верхний элемент стека */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("Стек пуст\n");
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
    /* Инициализировать стек */
    LinkedListStack *stack = newLinkedListStack();

    /* Поместить элемент в стек */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("Стек stack = ");
    printLinkedList(stack->top);

    /* Получить верхний элемент стека */
    int val = peek(stack);
    printf("Элемент на вершине стека top = %d\r\n", val);

    /* Извлечь элемент из стека */
    val = pop(stack);
    printf("Элемент, извлеченный из стека, pop = %d, 出栈后 stack =  ", val);
    printLinkedList(stack->top);

    /* Получить длину стека */
    printf("Длина стека size = %d\n", size(stack));

    /* Проверить, пуста ли структура */
    bool empty = isEmpty(stack);
    printf("Пуст ли стек = %s\n", empty ? "true" : "false");

    // Освободить память
    delLinkedListStack(stack);

    return 0;
}
