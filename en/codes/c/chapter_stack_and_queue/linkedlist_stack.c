/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Stack backed by a linked list */
typedef struct {
    ListNode *top; // Use the head node as the top of the stack
    int size;      // Stack size
} LinkedListStack;

/* Constructor */
LinkedListStack *newLinkedListStack() {
    LinkedListStack *s = malloc(sizeof(LinkedListStack));
    s->top = NULL;
    s->size = 0;
    return s;
}

/* Destructor */
void delLinkedListStack(LinkedListStack *s) {
    while (s->top) {
        ListNode *n = s->top->next;
        free(s->top);
        s->top = n;
    }
    free(s);
}

/* Get the stack size */
int size(LinkedListStack *s) {
    return s->size;
}

/* Check whether the stack is empty */
bool isEmpty(LinkedListStack *s) {
    return size(s) == 0;
}

/* Push an element onto the stack */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Link the new node to the current top
    node->val = num;     // Set the value of the new node
    s->top = node;       // Update the top of the stack
    s->size++;           // Update the stack size
}

/* Peek at the top element */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("Stack is empty\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* Remove and return the top element */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // Free the allocated memory
    free(tmp);
    s->size--;
    return val;
}

/* Driver code */
int main() {
    /* Initialize the stack */
    LinkedListStack *stack = newLinkedListStack();

    /* Push elements onto the stack */
    push(stack, 1);
    push(stack, 3);
    push(stack, 2);
    push(stack, 5);
    push(stack, 4);

    printf("stack = ");
    printLinkedList(stack->top);

    /* Peek at the top element */
    int val = peek(stack);
    printf("Top element (top) = %d\r\n", val);

    /* Pop the top element */
    val = pop(stack);
    printf("Popped element (pop) = %d, stack after the pop =  ", val);
    printLinkedList(stack->top);

    /* Get the stack size */
    printf("Stack size = %d\n", size(stack));

    /* Check whether the stack is empty */
    bool empty = isEmpty(stack);
    printf("Stack is empty = %s\n", empty ? "true" : "false");

    // Free the allocated memory
    delLinkedListStack(stack);

    return 0;
}
