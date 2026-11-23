/**
 * File: linkedlist_stack.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Stack implemented with a linked list */
typedef struct {
    ListNode *top; // Use the head node as the stack top
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

/* Push */
void push(LinkedListStack *s, int num) {
    ListNode *node = (ListNode *)malloc(sizeof(ListNode));
    node->next = s->top; // Set the new node's pointer field
    node->val = num;     // Set the new node's data field
    s->top = node;       // Update the stack top
    s->size++;           // Update the stack size
}

/* Access the top element */
int peek(LinkedListStack *s) {
    if (s->size == 0) {
        printf("Stack is empty\n");
        return INT_MAX;
    }
    return s->top->val;
}

/* Pop */
int pop(LinkedListStack *s) {
    int val = peek(s);
    ListNode *tmp = s->top;
    s->top = s->top->next;
    // Free memory
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

    printf("Stack stack = ");
    printLinkedList(stack->top);

    /* Access the top element */
    int val = peek(stack);
    printf("Top element top = %d\r\n", val);

    /* Pop an element from the stack */
    val = pop(stack);
    printf("Popped element pop = %d; after popping, stack =  ", val);
    printLinkedList(stack->top);

    /* Get the stack size */
    printf("Stack size = %d\n", size(stack));

    /* Check whether it is empty */
    bool empty = isEmpty(stack);
    printf("Is the stack empty = %s\n", empty ? "true" : "false");

    // Free memory
    delLinkedListStack(stack);

    return 0;
}
