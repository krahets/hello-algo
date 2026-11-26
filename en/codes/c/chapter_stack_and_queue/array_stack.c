/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Array-backed stack */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* Constructor */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // Allocate a large array up front to avoid resizing
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* Destructor */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* Get the stack size */
int size(ArrayStack *stack) {
    return stack->size;
}

/* Check whether the stack is empty */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* Push an element onto the stack */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("Stack is full\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* Peek at the top element */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("Stack is empty\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* Remove and return the top element */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* Driver code */
int main() {
    /* Initialize the stack */
    ArrayStack *stack = newArrayStack();

    /* Push elements onto the stack */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("stack = ");
    printArray(stack->data, stack->size);

    /* Peek at the top element */
    int val = peek(stack);
    printf("Top element (top) = %d\n", val);

    /* Pop the top element */
    val = pop(stack);
    printf("Popped element (pop) = %d, stack after the pop = ", val);
    printArray(stack->data, stack->size);

    /* Get the stack size */
    int size = stack->size;
    printf("Stack size = %d\n", size);

    /* Check whether the stack is empty */
    bool empty = isEmpty(stack);
    printf("Stack is empty = %s\n", empty ? "true" : "false");

    // Free the allocated memory
    delArrayStack(stack);

    return 0;
}
