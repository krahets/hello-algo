/**
 * File: array_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 5000

/* Stack class based on array */
typedef struct {
    int *data;
    int size;
} ArrayStack;

/* Constructor */
ArrayStack *newArrayStack() {
    ArrayStack *stack = malloc(sizeof(ArrayStack));
    // Initialize with large capacity to avoid resizing
    stack->data = malloc(sizeof(int) * MAX_SIZE);
    stack->size = 0;
    return stack;
}

/* Destructor */
void delArrayStack(ArrayStack *stack) {
    free(stack->data);
    free(stack);
}

/* Get the length of the stack */
int size(ArrayStack *stack) {
    return stack->size;
}

/* Determine if the stack is empty */
bool isEmpty(ArrayStack *stack) {
    return stack->size == 0;
}

/* Push */
void push(ArrayStack *stack, int num) {
    if (stack->size == MAX_SIZE) {
        printf("Stack is full\n");
        return;
    }
    stack->data[stack->size] = num;
    stack->size++;
}

/* Access stack top element */
int peek(ArrayStack *stack) {
    if (stack->size == 0) {
        printf("Stack is empty\n");
        return INT_MAX;
    }
    return stack->data[stack->size - 1];
}

/* Pop */
int pop(ArrayStack *stack) {
    int val = peek(stack);
    stack->size--;
    return val;
}

/* Driver Code */
int main() {
    /* Initialize stack */
    ArrayStack *stack = newArrayStack();

    /* Element push */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);
    printf("Stack stack =");
    printArray(stack->data, stack->size);

    /* Access stack top element */
    int val = peek(stack);
    printf("Top element of the stack top = %d\n", val);

    /* Element pop */
    val = pop(stack);
    printf("Pop element pop = %d, stack after pop = ", val);
    printArray(stack->data, stack->size);

    /* Get the length of the stack */
    int size = stack->size;
    printf("Stack length size =  %d\n", size);

    /* Determine if it's empty */
    bool empty = isEmpty(stack);
    printf("Is the stack empty = %stack\n", empty ? "true" : "false");

    // Free memory
    delArrayStack(stack);

    return 0;
}
