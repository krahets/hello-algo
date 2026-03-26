/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Стек на основе массива */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* Конструктор */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // Инициализировать большую вместимость, чтобы избежать расширения
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* Деструктор */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* Получить длину стека */
int size(ArrayStack *stack) {
    return stack->size;
}

/* Проверить, пуст ли стек */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* Поместить в стек */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("стекзаполнен\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* Получить верхний элемент стека */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("Стек пуст\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* Извлечь из стека */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* Driver Code */
int main() {
    /* Инициализировать стек */
    ArrayStack *stack = newArrayStack();

    /* Поместить элемент в стек */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("Стек stack = ");
    printArray(stack->data, stack->size);

    /* Получить верхний элемент стека */
    int val = peek(stack);
    printf("Элемент на вершине стека top = %d\n", val);

    /* Извлечь элемент из стека */
    val = pop(stack);
    printf("Извлеченный из стека элемент pop = %d, после извлечения stack = ", val);
    printArray(stack->data, stack->size);

    /* Получить длину стека */
    int size = stack->size;
    printf("Длина стека size = %d\n", size);

    /* Проверить, пуста ли структура */
    bool empty = isEmpty(stack);
    printf("Пуст ли стек = %s\n", empty ? "true" : "false");

    // Освободить память
    delArrayStack(stack);

    return 0;
}
